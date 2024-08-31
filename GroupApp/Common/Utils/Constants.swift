//
//  Constants.swift
//  GroupManager
//
//  Created by Jinu on 28/08/2024.
//

import Foundation

struct Constants {
    
    struct Urls {
        static let baseURL = "http://huddle-dev.messej.com/huddles/podium_dummy"

    }
    
}


enum ApiEndPoints  {
    case listing
    case groupInfo
   
}

extension ApiEndPoints {
    var path: String {
        switch self {
        case .listing:
            return "/huddles/podium_dummy"
        case .groupInfo:
            return "/huddles/podium_dummy"
        
        }
    }
}
