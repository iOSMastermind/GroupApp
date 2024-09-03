//
//  GroupInfoViewModel.swift
//  GroupApp
//
//  Created by Jinu on 03/09/2024.
//

import CoreData

class GroupInfoViewModel: ObservableObject {
     let context = PersistenceController.shared.container.viewContext

    func shouldShowEditButton(for group: GroupEntity) -> Bool {
        return group.userStatus == "Admin"
    }

    func deleteGroup(_ group: GroupEntity) {
        context.delete(group)
        do {
            try context.save()
        } catch {
            print("Failed to delete group: \(error)")
        }
    }
}
