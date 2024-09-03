//
//  Group.swift
//  GroupManager
//
//  Created by Jinu on 28/08/2024.
//

import Foundation

struct Group: Codable {
    let message: String
    let result: GroupResult
}

struct GroupResult: Codable {
    let currentPage: Int
    let groups: [GroupElement]
    let nextPage: Bool
    let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case groups
        case nextPage = "next_page"
        case total
    }
}


struct GroupElement: Codable,Identifiable {
    let bio: String
    let groupPhoto: String
    let id: Int
    let name: String
    let participantCount: Int
    let groupPrivate: Bool
    let unreadCount: Int
    let userStatus: String

    enum CodingKeys: String, CodingKey {
        case bio
        case groupPhoto = "group_photo"
        case id, name
        case participantCount = "participant_count"
        case groupPrivate = "private"
        case unreadCount = "unread_count"
        case userStatus = "user_status"
    }
}
