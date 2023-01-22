//
//  Student+CoreDataProperties.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 22/1/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var address: String?
    @NSManaged public var college: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var studentMoreInfo: NSSet?

}

// MARK: Generated accessors for studentMoreInfo
extension Student {

    @objc(addStudentMoreInfoObject:)
    @NSManaged public func addToStudentMoreInfo(_ value: StudentInfo)

    @objc(removeStudentMoreInfoObject:)
    @NSManaged public func removeFromStudentMoreInfo(_ value: StudentInfo)

    @objc(addStudentMoreInfo:)
    @NSManaged public func addToStudentMoreInfo(_ values: NSSet)

    @objc(removeStudentMoreInfo:)
    @NSManaged public func removeFromStudentMoreInfo(_ values: NSSet)

}

extension Student : Identifiable {

}
