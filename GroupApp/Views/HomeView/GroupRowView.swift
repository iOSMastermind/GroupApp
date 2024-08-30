//
//  GroupRowView.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//
import SwiftUI
import Kingfisher

struct GroupRowView: View {
    @ObservedObject var group: GroupEntity

    var body: some View {
        HStack(alignment: .top) {
            
            KFImage(URL(string: "\(group.groupPhoto)"))
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.top, -4)
            VStack(alignment: .leading, spacing: 4) {
                
                HStack(alignment: .top) {
                    Text(group.name)
                        .font(.headline)
                        .foregroundColor(.black)

                    Text(group.userStatus)
                        .font(.caption)
                        .padding(3)
                        .background(Color(hex:"#6994F8"))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }

                
                Text(group.bio)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.gray)
                    Text("\(group.participantCount)")
                        .foregroundColor(.gray)
                }

               
                Text("\(group.unreadCount)")
                    .font(.footnote)
                    .padding(8)
                    .background(Circle().fill(Color(hex:"#6994F8")))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, 8)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
