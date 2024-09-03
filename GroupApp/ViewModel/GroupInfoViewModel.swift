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

}
