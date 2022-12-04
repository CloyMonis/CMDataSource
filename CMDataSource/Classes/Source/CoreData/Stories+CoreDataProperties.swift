//
//  Stories+CoreDataProperties.swift
//  
//
//  Created by Cloy Vserv on 01/12/22.
//
//

import Foundation
import CoreData


extension Stories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stories> {
        return NSFetchRequest<Stories>(entityName: "Stories")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var heroID: Int32

}
