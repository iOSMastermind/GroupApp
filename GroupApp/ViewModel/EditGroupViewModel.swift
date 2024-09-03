//
//  EditGroupViewModel.swift
//  GroupApp
//
//  Created by Jinu on 03/09/2024.
//
import SwiftUI
import CoreData

class EditGroupViewModel: ObservableObject {
    @Published var name: String
    @Published var aboutGroup: String

    let group: GroupEntity
    private let context: NSManagedObjectContext

    private let nameCharacterLimit = 50
    private let aboutGroupCharacterLimit = 500

    init(group: GroupEntity, context: NSManagedObjectContext) {
        self.group = group
        self.name = group.name
        self.aboutGroup = group.bio
        self.context = context
    }

    func saveChanges() {
        group.name = name
        group.bio = aboutGroup

        do {
            try context.save()
        } catch {
            print("Failed to save edited group: \(error)")
        }
    }

    func validateName(_ newValue: String) {
        if newValue.count > nameCharacterLimit {
            name = String(newValue.prefix(nameCharacterLimit))
        }
    }

    func validateAboutGroup(_ newValue: String) {
        if newValue.count > aboutGroupCharacterLimit {
            aboutGroup = String(newValue.prefix(aboutGroupCharacterLimit))
        }
    }
}
