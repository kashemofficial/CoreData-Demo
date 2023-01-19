//
//  DatabaseHelper.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 19/1/23.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {

    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveStudentData(studentDict: [String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = studentDict["studentName"]
        student.collage = studentDict["collageName"]
        student.address = studentDict["studentAddress"]
        student.email = studentDict["studentEmail"]
        
        do{
            try context.save()
            
        }catch let err{
            print("Student save error: \(err.localizedDescription)")
            
        }
        
    }
    
    func getAllStudentData() -> [Student]{
        var arrStudent = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            arrStudent = try context.fetch(fetchRequest) as! [Student]
            
        }catch let err{
            print("Error in Student fetch: \(err.localizedDescription)")
        }
        return arrStudent
    }
    
    
}
