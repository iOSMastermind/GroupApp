//
//  HomeView.swift
//  GroupManager
//
//  Created by Jinu on 28/08/2024.
//

import SwiftUI


struct MainTabView: View {
    init() {
        // Customize the appearance of the Tab Bar
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color(hex:"#6994F8")) // Set the background color of the tab bar
        
        // Set the color for the selected tab
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Set the color for the unselected tabs
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color(hex:"#E0E0E0"))
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color(hex:"#E0E0E0"))]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                Text("Home View")
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                GroupsView()
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Message")
                    }
                
                Text("Settings View")
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
            }
            .background(Color(hex:"#A2C658")) // This might not be necessary for the TabView background.
        }
    }
}

