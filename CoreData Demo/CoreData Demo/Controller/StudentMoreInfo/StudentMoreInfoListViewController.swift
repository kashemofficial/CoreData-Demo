//
//  StudentMoreInfoListViewController.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 22/1/23.
//

import UIKit

class StudentMoreInfoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }

    @IBAction func StudentMoreInfoButtonClick(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StudentMoreInfoAddViewController") as! StudentMoreInfoAddViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
