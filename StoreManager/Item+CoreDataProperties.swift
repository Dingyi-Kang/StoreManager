//
//  Item+CoreDataProperties.swift
//  StoreManager
//
//   Team Project for Software Engineering course -- CS5473
//  Created by DingyiKang on 11/19/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int64
    @NSManaged public var price: Double

}

extension Item : Identifiable {

}
