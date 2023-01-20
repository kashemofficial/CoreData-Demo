//
//  StudentDetailsViewController.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 20/1/23.
//

import UIKit

class StudentDetailsViewController: UIViewController {
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentCollageLabel: UILabel!
    @IBOutlet weak var studentAddressLabel: UILabel!
    @IBOutlet weak var studentEmailLabel: UILabel!
    var studentDetails: Student?
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        studentNameLabel.text = studentDetails?.name
        studentCollageLabel.text = studentDetails?.collage
        studentAddressLabel.text = studentDetails?.address
        studentEmailLabel.text = studentDetails?.email
    }
    
}
