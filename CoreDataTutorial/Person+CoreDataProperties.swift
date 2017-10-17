//
//  Person+CoreDataProperties.swift
//  CoreDataTutorial
//
//  Created by Vivek on 2017-08-25.
//  Copyright © 2017 VivekVardhan. All rights reserved.
//
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
