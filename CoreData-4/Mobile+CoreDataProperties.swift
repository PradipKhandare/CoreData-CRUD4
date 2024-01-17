//
//  Mobile+CoreDataProperties.swift
//  CoreData-4
//
//  Created by NTS on 17/01/24.
//
//

import Foundation
import CoreData


extension Mobile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mobile> {
        return NSFetchRequest<Mobile>(entityName: "Mobile")
    }

    @NSManaged public var company: String?
    @NSManaged public var price: String?
    @NSManaged public var model: String?

}

extension Mobile : Identifiable {

}
