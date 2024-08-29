//
//  GroupDetailView.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//

import SwiftUI
import Kingfisher
    struct GroupDetailView: View {
//        var selectedGroup: GroupEntity
            var groupName: String = "Friends Forever"
            var companyName: String = "The Walt Disney Company"
            var memberCount: Int = 20
            var description: String = """
            Lorem ipsum dolor sit amet consectetur.
            Posuere massa cursus dignissim aliquam in
            aenean et nunc aliquam. Amet euismod blandit
            facilisis massa sit. Nulla in pulvinar.
            """
        let group: GroupEntity

            var body: some View {
                VStack {
                    // Header section with background color
                
                    ZStack(alignment: .top) {
                       
                        
                        VStack(spacing: 16) {
                            // Navigation icons
                            HStack {
                                Button(action: {
                                    // Back action
                                }) {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.white)
                                        .padding()
                                }

                                Spacer()
                                
                                Button(action: {
                                    // Edit action
                                }) {
                                    HStack {
                                                    Text("Edit")
                                                        .font(.system(size: 16, weight: .semibold))
                                                    Image(systemName: "pencil")
                                                        .font(.system(size: 16, weight: .bold))
                                                }
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 6)
                                                .background(Color.white.opacity(0.2)) // Semi-transparent background
                                                .foregroundColor(.white) // Text and icon color
                                                .cornerRadius(20) // Rounded corners
                                }

                                Button(action: {
                                    // Menu action
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .foregroundColor(.white)
                                        .padding()
                                }
                            }
                            .padding(.horizontal)
                            
                            // Profile image
                            KFImage(URL(string: "\(group.groupPhoto)"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 7)

                            // Group details
                            VStack(spacing: 0 ){
                                Text(group.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(0)
                                Text("The Walt Disney Company")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(.top,0)
                                    .padding(.bottom,10)
                                
                                HStack(spacing: 8) {
                                    Image(systemName: "person.2.fill")
                                        .foregroundColor(.white)
                                    Text("\(group.unreadCount)")
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom,4)
                            }
                        }
                    }
                    
                    // About Group Section
                    VStack(alignment: .leading) {
                        
                            Text("About Group")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex:"#6994F8"))
                                .padding(.top,20)
                                .frame(maxWidth: .infinity, alignment: .leading)

                        Text(group.bio)
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)


                        Spacer()

                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedCornerShape(radius: 40, corners: [.topLeft, .topRight]))
                    .shadow(radius: 5)
                    
                }
                
                .background(Color(hex:"#6994F8").ignoresSafeArea().edgesIgnoringSafeArea(.all))
                .edgesIgnoringSafeArea(.bottom)

            }
        }


