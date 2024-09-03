//
//  GroupAppApp.swift
//  GroupApp
//
//  Created by Jinu on 28/08/2024.
//

import SwiftUI

@main
struct GroupApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var groupViewModel = GroupViewModel()
       var body: some Scene {
           WindowGroup {
               MainTabView()
                   .environmentObject(groupViewModel)
                   .environment(\.managedObjectContext, persistenceController.container.viewContext)
           }
       }
   }

   
