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
    @ObservedObject var editGroupViewModel: EditGroupViewModel

    private let nameCharacterLimit = 50
    private let aboutGroupCharacterLimit = 500
    @FocusState private var isFocused: Bool

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

                    KFImage(URL(string: "\(editGroupViewModel.group.groupPhoto)"))
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
                        TextField("Enter name", text: $editGroupViewModel.name)
                            .focused($isFocused)
                            .onChange(of: editGroupViewModel.name) { oldValue, newValue in
                                editGroupViewModel.validateName(newValue)
                            }

                        Divider()
                            .padding(.top, 8)

                        HStack {
                            Spacer()
                            Text("\(editGroupViewModel.name.count)/\(nameCharacterLimit)")
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
                        TextField("About Group", text: $editGroupViewModel.aboutGroup, axis: .vertical)
                            .focused($isFocused)
                            .onSubmit {
                                isFocused = false
                            }
                            .padding()
                            .frame(height: 120, alignment: .topLeading)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .onTapGesture {
                                isFocused = false
                            }
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
                            .onChange(of: editGroupViewModel.aboutGroup) { oldValue, newValue in
                                editGroupViewModel.validateAboutGroup(newValue)
                            }

                        HStack {
                            Spacer()
                            Text("\(editGroupViewModel.aboutGroup.count)/\(aboutGroupCharacterLimit)")
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
                        editGroupViewModel.saveChanges()
                        presentationMode.wrappedValue.dismiss()
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
        .onTapGesture {
            isFocused = false
        }
        .background(Color(hex: "#6994F8").ignoresSafeArea())
        .edgesIgnoringSafeArea(.bottom)
    }
}
