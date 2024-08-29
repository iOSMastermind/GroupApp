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

       var body: some Scene {
           WindowGroup {
               HomeScreen()
                   .environmentObject(GroupViewModel.shared)
           }
       }
   }

   
