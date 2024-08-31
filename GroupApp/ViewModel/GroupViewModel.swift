//
//  GroupViewModel.swift
//  GroupManager
//
//  Created by Jinu on 28/08/2024.
//

import SwiftUI
import CoreData

class GroupViewModel: ObservableObject {
    
    @Published var groupElements: [GroupEntity] = []
//    static let shared = GroupViewModel()
    
    private let context = PersistenceController.shared.container.viewContext
    func shouldShowEditButton(for group: GroupEntity) -> Bool {
            return group.userStatus == "Admin"
        }
    init() {
//        fetchGroups()
        fetchFromCoreData()
    }
    
    func fetchGroups() {
        RequestServices.requestDomain = Constants.Urls.baseURL
        
        RequestServices.fetchData { [weak self] result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    // Handle the case where `data` is nil
                    return
                }

                do {
                    let group = try JSONDecoder().decode(Group.self, from: data)
                    DispatchQueue.main.async {
                        self?.saveToCoreData(groups: group.result.groups)
                        self?.fetchFromCoreData()
                    }
                } catch {
                    // Handle the decoding error
                    print("Decoding error: \(error)")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func saveToCoreData(groups: [GroupElement]) {
        // Delete existing data
        let fetchRequest: NSFetchRequest<GroupEntity> = GroupEntity.fetchRequest()
        do {
            let existingGroups = try context.fetch(fetchRequest)
            for group in existingGroups {
                context.delete(group)
            }
            try context.save()
        } catch {
            print("Failed to delete existing groups: \(error)")
        }

        // Save new data
        for group in groups {
            let groupEntity = GroupEntity(context: context)
            groupEntity.bio = group.bio
            groupEntity.groupPhoto = group.groupPhoto
            groupEntity.id = Int32(group.id)
            groupEntity.name = group.name
            groupEntity.participantCount = Int32(group.participantCount)
            groupEntity.groupPrivate = group.groupPrivate
            groupEntity.unreadCount = Int32(group.unreadCount)
            groupEntity.userStatus = group.userStatus
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save groups: \(error)")
        }
    }
    
    private func fetchFromCoreData() {
        let fetchRequest: NSFetchRequest<GroupEntity> = GroupEntity.fetchRequest()
        
        // Execute fetch on a background context to avoid blocking the main thread
        context.perform {
            do {
                let results = try self.context.fetch(fetchRequest)
                
                DispatchQueue.main.async {
                    if results.isEmpty {
                        // If Core Data is empty, fetch from the API
                        self.fetchGroups()
                    } else {
                        // Use the Core Data results
                        self.groupElements = results
                    }
                }
            } catch {
                print("Failed to fetch groups from Core Data: \(error)")
            }
        }
    }
        func saveEditedData(group: GroupEntity, newName: String, newBio: String) {
            group.name = newName
            group.bio = newBio
            
            do {
                try context.save()
                fetchFromCoreData()
            } catch {
                print("Failed to save edited group: \(error)")
            }
        }
    
}
