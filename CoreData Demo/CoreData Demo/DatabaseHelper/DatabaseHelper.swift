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
        student.college = studentDict["collegeName"]
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
    
    func deleteStudentData(index: Int) -> [Student]{
        var studentData = self.getAllStudentData()
        context.delete(studentData[index])
        studentData.remove(at: index)
        do{
            try context.save()
        }catch let err{
            print("delete student data: \(err.localizedDescription)")
        }
        return studentData
    }
    
    func editStudentData(studentDict: [String: String], index : Int){
        let student = self.getAllStudentData()
        student[index].name = studentDict["studentName"]
        student[index].college = studentDict["collegeName"]
        student[index].address = studentDict["studentAddress"]
        student[index].email = studentDict["studentEmail"]
        do{
            try context.save()
        }catch{
            print("error in edit data")
        }
    }
    
    func saveStudentMoreInfoData(studentMoreInfoDict: [String:String],student: Student){
        let studentInfo = NSEntityDescription.insertNewObject(forEntityName: "StudentInfo", into: context) as! StudentInfo
        studentInfo.names = studentMoreInfoDict["studentMoreInfonames"]
        studentInfo.phone = studentMoreInfoDict["studentMoreInfophone"]
        studentInfo.rollno = studentMoreInfoDict["studentMoreInforollno"]
        studentInfo.subject1 = studentMoreInfoDict["studentMoreInfosubject1"]
        studentInfo.subject2 = studentMoreInfoDict[            "studentMoreInfosubject2"]
        studentInfo.universities = student
        
        do{
            try context.save()
        }catch let err{
            print("Student save error: \(err.localizedDescription)")
        }

    }
    
    func getAllStudentMoreInfoData() -> [StudentInfo]{
        var arrStudentInfo = [StudentInfo]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StudentInfo")
        do{
            arrStudentInfo = try context.fetch(fetchRequest) as! [StudentInfo]
        }catch let err{
            print("Error in studntInfo fetch:  \(err.localizedDescription)")
        }
        
        return arrStudentInfo
    }
    
    
    
}
