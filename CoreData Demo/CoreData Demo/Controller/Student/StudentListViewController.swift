//
//  ViewController.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 19/1/23.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {    

   @IBOutlet weak var studentListTableView: UITableView!
    var arrStudent = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.arrStudent = DatabaseHelper.shareInstance.getAllStudentData()
        studentListTableView.reloadData()
    }

    func setUpTableView(){
        let nib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        studentListTableView.register(nib, forCellReuseIdentifier: "StudentTableViewCell")
        studentListTableView.delegate = self
        studentListTableView.dataSource = self
    }
    
    @IBAction func leftBarButtonAction(_ sender: UIBarButtonItem){
        let vc = storyboard?.instantiateViewController(withIdentifier: "StudentAddViewController") as! StudentAddViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as! StudentTableViewCell
        cell.student = arrStudent[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentDetailVC = storyboard?.instantiateViewController(withIdentifier: "StudentDetailsViewController") as! StudentDetailsViewController
        studentDetailVC.studentDetails = arrStudent[indexPath.row]
        studentDetailVC.indexRow = indexPath.row
        self.navigationController?.pushViewController(studentDetailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrStudent = DatabaseHelper.shareInstance.deleteStudentData(index: indexPath.row)
            self.studentListTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
