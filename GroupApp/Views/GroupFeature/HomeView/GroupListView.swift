//
//  GroupListView.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//

import SwiftUI
import CoreData

struct GroupListView: View {
    @State private var isSheetPresented = false
    @State private var selectedGroup: GroupEntity? = nil
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \GroupEntity.name, ascending: true)],
        animation: .default
    ) private var groups: FetchedResults<GroupEntity>


    @EnvironmentObject var groupViewModel: GroupViewModel

    var body: some View {
        if groups.isEmpty {
            VStack {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding(.top, 50)
                    .font(.system(size: 18))
            }
            .padding()
            Spacer()
        } else {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(groups) { group in
                        GroupRowView(group: group)
                            .onTapGesture {
                                selectedGroup = group
                                isSheetPresented = true
                            }
                        Divider()
                    }
                }
                .padding()
                .padding(.top, 80)
            }
            .scrollIndicators(.hidden)
            .sheet(item: $selectedGroup) { group in
                GroupInfoScreen(group: group)
                    .environmentObject(groupViewModel) 
                    .presentationDetents([.large])
                    .presentationDragIndicator(.hidden)
            }
        }
    }
}
