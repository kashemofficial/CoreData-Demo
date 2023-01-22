//
//  StudentDetailsViewController.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 20/1/23.
//

import UIKit

class StudentDetailsViewController: UITableViewController {
    
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentCollegeLabel: UILabel!
    @IBOutlet weak var studentAddressLabel: UILabel!
    @IBOutlet weak var studentEmailLabel: UILabel!
    @IBOutlet weak var studentMoreInfoLabel: UILabel!
    
    var studentDetails: Student?
    var indexRow = Int()
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        studentNameLabel.text = studentDetails?.name
        studentCollegeLabel.text = studentDetails?.college
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "StudentMoreInfoListViewController") as! StudentMoreInfoListViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
