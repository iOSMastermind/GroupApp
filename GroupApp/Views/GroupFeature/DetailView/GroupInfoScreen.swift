//
//  GroupDetailView.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//
import SwiftUI
import Kingfisher

struct GroupInfoScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isSheetPresented = false

    @ObservedObject var groupInfoViewModel: GroupInfoViewModel
    @ObservedObject var group: GroupEntity

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                VStack(spacing: 16) {
                    
                    KFImage(URL(string: "\(group.groupPhoto)"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 7)

                    VStack(spacing: 0) {
                        Text(group.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("The Walt Disney Company")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.top, 0)
                            .padding(.bottom, 10)
                        
                        HStack(spacing: 8) {
                            Image(systemName: "person.2.fill")
                                .foregroundColor(.white)
                            Text("\(group.participantCount)")
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 4)
                    }
                }
                .padding(.top, 16)
            }

            VStack(alignment: .leading) {
                Text("About Group")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex:"#6994F8"))
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(group.bio)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding()
            .background(Color.white)
            .clipShape(RoundedCornerShape(radius: 40, corners: [.topLeft, .topRight]))
            .shadow(radius: 5)
        }
        .background(Color(hex:"#6994F8").ignoresSafeArea().edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline) // Keeps the title in the center
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            },
            trailing: HStack {
                if groupInfoViewModel.shouldShowEditButton(for: group) {
                    Button(action: {
                        isSheetPresented = true
                    }) {
                        HStack {
                            Text("Edit")
                                .font(.system(size: 16, weight: .semibold))
                            Image(systemName: "pencil")
                                .font(.system(size: 16, weight: .bold))
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    }
                }
                
                Button(action: {
                    // Action for the menu button
                }) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.white)
                        .padding()
                }
            }
        )
        .sheet(isPresented: $isSheetPresented) {
            NavigationView {
                EditScreen(editGroupViewModel: EditGroupViewModel(group: group, context: groupInfoViewModel.context))
            }
        }
    }
}
