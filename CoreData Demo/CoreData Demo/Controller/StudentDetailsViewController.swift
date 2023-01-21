//
//  StudentDetailsViewController.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 20/1/23.
//

import UIKit

class StudentDetailsViewController: UITableViewController {
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentCollageLabel: UILabel!
    @IBOutlet weak var studentAddressLabel: UILabel!
    @IBOutlet weak var studentEmailLabel: UILabel!
    var studentDetails: Student?
    var indexRow = Int()
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        studentNameLabel.text = studentDetails?.name
        studentCollageLabel.text = studentDetails?.collage
        studentAddressLabel.text = studentDetails?.address
        studentEmailLabel.text = studentDetails?.email
    }
    
    @IBAction func leftBarButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        let studentListVC = storyboard?.instantiateViewController(withIdentifier: "StudentAddViewController") as! StudentAddViewController
        studentListVC.isUpdate = true
        studentListVC.indexRow = indexRow
        studentListVC.studentDetails = studentDetails
        self.navigationController?.pushViewController(studentListVC, animated: false)
        
    }
    
    
    
}
