//
//  GroupRowView.swift
//  GroupApp
//
//  Created by Jinu on 29/08/2024.
//
import SwiftUI
import Kingfisher // Ensure Kingfisher is imported

struct GroupRowView: View {
    let group: GroupEntity

    var body: some View {
        HStack(alignment: .top) { // Align the main HStack to the top
            // Group Image
            KFImage(URL(string: "\(group.groupPhoto)"))
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.top, -4)
            VStack(alignment: .leading, spacing: 4) {
                // Group Name and Status - Aligned to the top
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

                // Last message
                Text(group.bio)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer() // Keeps items aligned on the right side

            // Participants Count - Aligned to the top
            VStack(alignment: .trailing, spacing: 4) {
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.gray)
                    Text("\(group.participantCount)")
                        .foregroundColor(.gray)
                }

                // Unread Count
                Text("\(group.unreadCount)")
                    .font(.footnote)
                    .padding(8)
                    .background(Circle().fill(Color(hex:"#6994F8")))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, 8) // Adjust vertical padding as necessary
        .frame(maxHeight: .infinity, alignment: .top) // Align the entire view to the top within available space
    }

    // Status Color function to determine color based on status
    func statusColor(for status: String) -> Color {
        switch status {
        case "dmin", "Invited", "requested":
            return Color.blue
        default:
            return Color.gray
        }
    }
}

