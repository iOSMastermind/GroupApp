//
//  GroupListView.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//

import SwiftUI

struct GroupListView: View {
    @State private var isSheetPresented = false
    @State private var selectedGroup: GroupEntity? = nil
    @EnvironmentObject var groupViewModel: GroupViewModel

    var body: some View {
        if  groupViewModel.groupElements.count > 0 {
       
        ScrollView {
            VStack(spacing: 8) {
                // List of group elements
                ForEach(groupViewModel.groupElements) { group in
//                                if let name = element.name {
                                    GroupRowView(group: group)
                                        .onTapGesture {
                                            selectedGroup = group
                                            isSheetPresented = true

                                        }
                                    Divider()
                                    }
//                    else {
//                                        EmptyView() // Ensures ForEach always returns a view
//                                    }
//                            }
//                ForEach(sampleGroups) { group in
//                    GroupRowView(group: group)
//                        .onTapGesture {
//                            selectedGroup = group
//                            isSheetPresented = true
//
//                        }
//                    Divider()
//                }
            }
            .padding()
            .padding(.top, 80)

        }
        .scrollIndicators(.hidden) 
        .sheet(item: $selectedGroup) { group in
            GroupDetailView(group: group)
                .presentationDetents([.large]) // Allows the sheet to be draggable between sizes
                .presentationDragIndicator(.hidden) // Show the grabber
        }

        } else {
            VStack {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding(.top,50)
                    .font(.system(size: 8))
            }
            .padding()
            Spacer()
        }
    }
}
