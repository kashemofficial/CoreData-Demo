//
//  StudentInfo+CoreDataProperties.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 23/1/23.
//
//

import Foundation
import CoreData


extension StudentInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentInfo> {
        return NSFetchRequest<StudentInfo>(entityName: "StudentInfo")
    }

    @NSManaged public var names: String?
    @NSManaged public var phone: String?
    @NSManaged public var rollno: String?
    @NSManaged public var subject1: String?
    @NSManaged public var subject2: String?
    @NSManaged public var universities: Student?

}

extension StudentInfo : Identifiable {

}
