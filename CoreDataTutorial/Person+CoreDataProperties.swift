//
//  Person+CoreDataProperties.swift
//  CoreDataTutorial
//
//  Created by Govind on 2017-08-25.
//  Copyright © 2017 Govind Lokhande. All rights reserved.
//  Author:- Govind 
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: Int32

}
