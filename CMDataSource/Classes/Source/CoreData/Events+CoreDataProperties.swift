//
//  Events+CoreDataProperties.swift
//  
//
//  Created by Cloy Vserv on 01/12/22.
//
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var name: String?
    @NSManaged public var heroID: Int32

}
