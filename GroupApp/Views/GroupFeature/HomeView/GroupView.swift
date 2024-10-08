//
//  GroupView.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//

import SwiftUI

struct GroupsView: View {
    @EnvironmentObject var groupViewModel: GroupViewModel

    var body: some View {
            
            ZStack {
                
                Color(hex:"#6994F8").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    VStack {
                       
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
                        
                        VStack {
                            GroupListView()
                                .frame(maxWidth: .infinity)
                        }
                            .background(Color.white)
                            .clipShape(RoundedCornerShape(radius: 40, corners: [.topLeft, .topRight]))
                            .padding(.top, -20)
                            .shadow(radius: 5)

                    }
                }
            }
    }
}




