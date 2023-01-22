//
//  StudentMoreInfoListViewController.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 22/1/23.
//

import UIKit

class StudentMoreInfoListViewController: UIViewController {

    @IBOutlet weak var studentMoreInfoTableView: UITableView!
    var arrStudentInfo = [StudentInfo]()
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentMoreInfoTableViewSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        if student?.studentMoreInfo?.allObjects != nil{
            arrStudentInfo = student?.studentMoreInfo?.allObjects as! [StudentInfo]
        }
        
//        arrStudentInfo = DatabaseHelper.shareInstance.getAllStudentMoreInfoData()
        studentMoreInfoTableView.reloadData()
    }
    
    
    @IBAction func studentMoreInfoBackButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func StudentMoreInfoButtonClick(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let studentInfoButtonVC = storyboard.instantiateViewController(withIdentifier: "StudentMoreInfoAddViewController") as! StudentMoreInfoAddViewController
        studentInfoButtonVC.student = student
        self.navigationController?.pushViewController(studentInfoButtonVC, animated: true)
        
    }
    
    func studentMoreInfoTableViewSetup(){
        let nib = UINib(nibName: "StudnetMoreInfoTableViewCell", bundle: nil)
        studentMoreInfoTableView.register(nib, forCellReuseIdentifier: "StudnetMoreInfoTableViewCell")
        studentMoreInfoTableView.delegate = self
        studentMoreInfoTableView.dataSource = self
    }

}

extension StudentMoreInfoListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudentInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudnetMoreInfoTableViewCell") as! StudnetMoreInfoTableViewCell
        cell.studentsInfo = arrStudentInfo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146
    }
    
}
