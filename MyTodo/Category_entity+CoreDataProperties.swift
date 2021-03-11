//
//  Category_entity+CoreDataProperties.swift
//  MyTodo
//
//  Created by Piotr Brus on 25/02/2021.
//
//

import Foundation
import CoreData
import UIKit.UIColor


extension Category_entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category_entity> {
        return NSFetchRequest<Category_entity>(entityName: "Category_entity")
    }

    @NSManaged public var cat_id: UUID?
    @NSManaged public var cat_name: String?
    @NSManaged public var color: UIColor?
    @NSManaged public var icon: String?

}

extension Category_entity : Identifiable {

}
