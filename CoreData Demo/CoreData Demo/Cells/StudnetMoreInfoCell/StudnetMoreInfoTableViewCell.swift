//
//  StudnetMoreInfoTableViewCell.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 22/1/23.
//

import UIKit

class StudnetMoreInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var studentInfoNameLabel: UILabel!
    @IBOutlet weak var studentInfoPhoneLabel: UILabel!
    @IBOutlet weak var studentInfoRollNoLabel: UILabel!
    @IBOutlet weak var studentInfoSubject1Label: UILabel!
    @IBOutlet weak var studentInfoSubject2Label: UILabel!
    
    var studentsInfo : StudentInfo? {
        didSet{
            studentInfoNameLabel.text = "Name: \(studentsInfo?.names ?? "")"
            studentInfoPhoneLabel.text = "Phone: \(studentsInfo?.phone ?? "")"
            studentInfoRollNoLabel.text = "Roll No: \(studentsInfo?.rollno ?? "")"
            studentInfoSubject1Label.text = "Subject1: \(studentsInfo?.subject1 ?? "" )"
            studentInfoSubject2Label.text = "Subject2: \(studentsInfo?.subject2 ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
