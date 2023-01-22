//
//  StudentMoreInfoAddViewController.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 22/1/23.
//

import UIKit

class StudentMoreInfoAddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var rollNoTextField: UITextField!
    @IBOutlet weak var subject1TextField: UITextField!
    @IBOutlet weak var subject2TextField: UITextField!
    
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func moreInfoAddBackButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonClick(_ sender: UIButton) {
        guard let studentMoreInfonames = nameTextField.text else{return}
        guard let studentMoreInfophone = phoneTextField.text else{return}
        guard let studentMoreInforollno = rollNoTextField.text else{return}
        guard let studentMoreInfosubject1 = subject1TextField.text else{return}
        guard let studentMoreInfosubject2 = subject2TextField.text else{return}
        guard let mainStudent = student else{return }
        
        let studentMoreInfoDict = [
            "studentMoreInfonames"    : studentMoreInfonames,
            "studentMoreInfophone"    : studentMoreInfophone,
            "studentMoreInforollno"   : studentMoreInforollno,
            "studentMoreInfosubject1" : studentMoreInfosubject1,
            "studentMoreInfosubject2" : studentMoreInfosubject2
         
        ]
        
        DatabaseHelper.shareInstance.saveStudentMoreInfoData(studentMoreInfoDict: studentMoreInfoDict, student: mainStudent)
    
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
