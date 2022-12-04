//
//  Comic+CoreDataProperties.swift
//  
//
//  Created by Cloy Vserv on 01/12/22.
//
//

import Foundation
import CoreData


extension Comic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comic> {
        return NSFetchRequest<Comic>(entityName: "Comic")
    }

    @NSManaged public var name: String?
    @NSManaged public var heroID: Int32

}
