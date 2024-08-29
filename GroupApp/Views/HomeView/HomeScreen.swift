//
//  HomeView.swift
//  GroupManager
//
//  Created by Jinu on 28/08/2024.
//

import SwiftUI

struct HomeScreen: View {
    init() {
           // Customize the appearance of the Tab Bar
           let appearance = UITabBarAppearance()
           appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color(hex:"#6994F8")) // Set the background color of the tab bar
        
           appearance.stackedLayoutAppearance.selected.iconColor = .white
           appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
           appearance.stackedLayoutAppearance.normal.iconColor = .white
           appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
           
           UITabBar.appearance().standardAppearance = appearance
           UITabBar.appearance().scrollEdgeAppearance = appearance
       }
    var body: some View {
//            ForEach(groupViewModel.groupElements) { element in
//                if let name = element.name {
//                        Text(name)
//                    } else {
//                        EmptyView() // Ensures ForEach always returns a view
//                    }
//            }
           
   
            TabView {
                // Main Groups View
                GroupsView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                Text("Messages View")
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Messages")
                    }
                
                Text("Settings View")
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
            }
            .background(Color(hex:"#A2C658"))
//            .background(Color.white.opacity(0.5).overlay(Color.blue.opacity(0.5)).ignoresSafeArea()) // Blue background for entire screen
        
        }
        
    }


