//
//  StudentAddViewController.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 19/1/23.
//

import UIKit

class StudentAddViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var collegeNameTextField: UITextField!
    @IBOutlet weak var studentAddressTextField: UITextField!
    @IBOutlet weak var studentEmailTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var isUpdate = false
    var indexRow = Int()
    var studentDetails : Student?
    //MARK: view LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentNameTextField.text = studentDetails?.name
        collegeNameTextField.text = studentDetails?.college
        studentAddressTextField.text = studentDetails?.address
        studentEmailTextField.text = studentDetails?.email
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if isUpdate{
            saveButton.setTitle("Update", for: .normal)
            self.title = "Update Data"

        }else{
            saveButton.setTitle("Save", for: .normal)
            self.title = "Save Data"

        }
        
    }
    
    
    @IBAction func leftBarButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: Action
    @IBAction func saveButtonAction(_ sender: UIButton) {
        self.studentSaveData()
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension StudentAddViewController{
    
    //MARK: Methods
    func studentSaveData(){
        guard let studentName = studentNameTextField.text else{return}
        guard let collegeName = collegeNameTextField.text else{return}
        guard let studentAddress = studentAddressTextField.text else{return}
        guard let studentEmail = studentEmailTextField.text else{return}
     
        let studentDict = [
            "studentName" : studentName,
            "collegeName" : collegeName,
            "studentAddress" : studentAddress,
            "studentEmail" : studentEmail
        ]
        
        if isUpdate{
            DatabaseHelper.shareInstance.editStudentData(studentDict: studentDict, index: indexRow)
            isUpdate = false
        }else{
            DatabaseHelper.shareInstance.saveStudentData(studentDict: studentDict)
        }
       
    }
    
}
