//
//  Series+CoreDataProperties.swift
//  
//
//  Created by Cloy Vserv on 01/12/22.
//
//

import Foundation
import CoreData


extension Series {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Series> {
        return NSFetchRequest<Series>(entityName: "Series")
    }

    @NSManaged public var name: String?
    @NSManaged public var heroID: Int32

}
