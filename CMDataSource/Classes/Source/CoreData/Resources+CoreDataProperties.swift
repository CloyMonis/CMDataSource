//
//  Resources+CoreDataProperties.swift
//  
//
//  Created by Cloy Vserv on 01/12/22.
//
//

import Foundation
import CoreData


extension Resources {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Resources> {
        return NSFetchRequest<Resources>(entityName: "Resources")
    }

    @NSManaged public var resourceUrl: String?
    @NSManaged public var type: String?
    @NSManaged public var heroID: Int32

}
