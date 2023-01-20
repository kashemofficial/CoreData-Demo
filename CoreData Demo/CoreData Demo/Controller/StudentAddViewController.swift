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
    @IBOutlet weak var collageNameTextField: UITextField!
    @IBOutlet weak var studentAddressTextField: UITextField!
    @IBOutlet weak var studentEmailTextField: UITextField!
    
    //MARK: view LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        guard let collageName = collageNameTextField.text else{return}
        guard let studentAddress = studentAddressTextField.text else{return}
        guard let studentEmail = studentEmailTextField.text else{return}
     
        let studentDict = [
            "studentName" : studentName,
            "collageName" : collageName,
            "studentAddress" : studentAddress,
            "studentEmail" : studentEmail
        ]
        DatabaseHelper.shareInstance.saveStudentData(studentDict: studentDict)
    }
    
}
