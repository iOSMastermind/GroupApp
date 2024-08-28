//
//  GroupAppApp.swift
//  GroupApp
//
//  Created by Jinu on 28/08/2024.
//

import SwiftUI

@main
struct GroupAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
