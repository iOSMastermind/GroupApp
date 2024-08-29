//
//  GroupView.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
//        NavigationView {
            
            ZStack {
                // Full screen blue background
                Color(hex:"#6994F8").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Curved header and content background
                    VStack {
                        // Header with title and icons
                        HStack {
                            Text("GROUPS")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                            
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        // Rounded content view
                        VStack {
                            GroupListView()
                                .frame(maxWidth: .infinity)
                        }
                            .background(Color.white)
                            .clipShape(RoundedCornerShape(radius: 40, corners: [.topLeft, .topRight]))
                            .padding(.top, -20)
                            .shadow(radius: 5)

                    }
                    //.padding(.horizontal)
                }
            }
//        }
    }
}




