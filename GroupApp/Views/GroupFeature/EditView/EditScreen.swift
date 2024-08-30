//
//  EditScreen.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//

import SwiftUI
import Kingfisher

struct EditScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var groupViewModel: GroupViewModel
    @State private var name: String = ""
    @State private var aboutGroup: String = ""
    var group: GroupEntity
    
    private let nameCharacterLimit = 50
    private let aboutGroupCharacterLimit = 500
    @FocusState private var isFocused: Bool

    init(group: GroupEntity) {
        self.group = group
        _name = State(initialValue: group.name)
        _aboutGroup = State(initialValue: group.bio)
    }

    var body: some View {
        VStack {
            ZStack {
                Color(hex: "#6994F8")
                    .ignoresSafeArea()

                VStack(spacing: 16) {
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
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .padding(.horizontal)

                    KFImage(URL(string: "\(group.groupPhoto)"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 7)
                }
            }
            .frame(height: 200)

            VStack {
                VStack(alignment: .leading) {
                    Text("Name")
                        .foregroundColor(Color(hex: "#6994F8"))
                        .font(.system(size: 18, weight: .semibold))
                    
                    VStack(alignment: .leading) {
                        TextField("Enter name", text: $name)
                            .focused($isFocused)
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
                    .padding(.bottom, 16)
                }
                .padding(.horizontal)
                .padding(.top, 20)

                VStack(alignment: .leading) {
                    Text("About Group")
                        .foregroundColor(Color(hex: "#6994F8"))
                        .font(.system(size: 18, weight: .semibold))
                    
                    VStack(alignment: .leading) {
                        TextField("About Group", text: $aboutGroup,axis: .vertical)
                            .focused($isFocused)
                            .padding()
                            .frame(height: 120,alignment: .topLeading)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    HStack {
                                        Spacer()
                                        Button("Done") {
                                            isFocused = false
                                        }
                                    }
                                }
                            }
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

                HStack(spacing: 32) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.red)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 1)
                            )
                    }
                    
                    Button(action: {
                        saveChanges()
                    }) {
                        Text("Save")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "#6994F8"))
                            .cornerRadius(10)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 32)
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
    
    private func saveChanges() {
        groupViewModel.saveEditedData(group: group, newName: name, newBio: aboutGroup)
        presentationMode.wrappedValue.dismiss()
    }
}
