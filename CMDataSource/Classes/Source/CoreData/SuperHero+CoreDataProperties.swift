//
//  SuperHero+CoreDataProperties.swift
//  
//
//  Created by Cloy Vserv on 01/12/22.
//
//

import Foundation
import CoreData


extension SuperHero {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SuperHero> {
        return NSFetchRequest<SuperHero>(entityName: "SuperHero")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: Int32
    @NSManaged public var imageUrl: String?
    @NSManaged public var key: Int32
    @NSManaged public var isBookmarked: Bool
    @NSManaged public var name: String?

}
