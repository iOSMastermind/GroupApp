//
//  GroupEntity+CoreDataProperties.swift
//  GroupApp
//
//  Created by Jinu on 28/08/2024.
//
//

import Foundation
import CoreData


extension GroupEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupEntity> {
        return NSFetchRequest<GroupEntity>(entityName: "GroupEntity")
    }

    // Update properties to be non-optional
       @NSManaged public var bio: String
       @NSManaged public var groupPhoto: String
       @NSManaged public var id: Int32
       @NSManaged public var name: String
       @NSManaged public var participantCount: Int32
       @NSManaged public var groupPrivate: Bool
       @NSManaged public var unreadCount: Int32
       @NSManaged public var userStatus: String
       
       // Override awakeFromInsert to provide default values
       public override func awakeFromInsert() {
           super.awakeFromInsert()
           // Set default values here
           self.bio = ""
           self.groupPhoto = ""
           self.name = ""
           self.userStatus = ""
           // The other properties like id, participantCount, groupPrivate, and unreadCount already have default values set in Core Data
       }

}

extension GroupEntity : Identifiable {

}
