//
//  EditScreen.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//

import SwiftUI
import SwiftUI
import Kingfisher

struct EditScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var aboutGroup: String = ""
    private let nameCharacterLimit = 50
    private let aboutGroupCharacterLimit = 500
    
    let group: GroupEntity

    var body: some View {
        VStack {
            ZStack {
                Color(hex: "#6994F8")
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    // Navigation Bar
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .padding()
                        }

                        Spacer()

                        Button(action: {
                            // Menu action
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .padding(.horizontal)

                    // Profile Image
                    KFImage(URL(string: "\(group.groupPhoto)"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 7)

                }
            }
            .frame(height: 200)

            VStack {
                // Name TextField
                           VStack(alignment: .leading) {
                               Text("Name")
                                   .foregroundColor(Color(hex:"#6994F8"))
                                   .font(.system(size: 18, weight: .semibold))
                               
                               VStack(alignment: .leading) {
                                   TextField("Enter name", text: $name)
                                       .onChange(of: name) { oldValue, newValue in
                                           if newValue.count > nameCharacterLimit {
                                               name = String(newValue.prefix(nameCharacterLimit))
                                           }
                                       }
                                   
                                   Divider()
                                       .padding(.top, 8)
                                   
                                   HStack {
                                       Spacer()
                                       Text("\(name.count)/\(nameCharacterLimit)")
                                           .font(.caption)
                                           .foregroundColor(.gray)
                                           .padding(.trailing, 8)
                                           .padding(.top, 4)
                                   }
                               }
                               .padding(.bottom, 16) // Padding to give some space at the bottom

                               
                              
                           }
                           .padding(.horizontal)
                           .padding(.top, 20)

                           // About Group TextView
                VStack(alignment: .leading) {
                    Text("About Group")
                        .foregroundColor(Color(hex: "#6994F8"))
                        .font(.system(size: 18, weight: .semibold))
                    
                    VStack(alignment: .leading) { // Ensure alignment is leading inside this VStack as well
                        TextField("About Group", text: $aboutGroup, axis: .vertical)
                            .padding()
                            .frame(height: 120, alignment: .topLeading)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .onChange(of: aboutGroup) { oldValue, newValue in
                                if newValue.count > aboutGroupCharacterLimit {
                                    aboutGroup = String(newValue.prefix(aboutGroupCharacterLimit))
                                }
                            }
                        
                        HStack {
                            Spacer()
                            Text("\(aboutGroup.count)/\(aboutGroupCharacterLimit)")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                                .padding(.bottom, 4)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)

                           Spacer()

                // Cancel and Save Buttons
                HStack {
                    Button(action: {
                        // Cancel action
                    }) {
                        Text("Cancel")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 2)
                            )
                    }

                    Button(action: {
                        // Save action
                    }) {
                        Text("Save")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#6994F8"))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
                Spacer()
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedCornerShape(radius: 40, corners: [.topLeft, .topRight]))
            .shadow(radius: 5)
            
        }
        .background(Color(hex: "#6994F8").ignoresSafeArea())
        .edgesIgnoringSafeArea(.bottom)
    }
}


//#Preview {
//    EditScreen()
//}
