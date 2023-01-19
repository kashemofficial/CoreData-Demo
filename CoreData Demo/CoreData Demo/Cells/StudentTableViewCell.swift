//
//  StudentTableViewCell.swift
//  CoreData Demo
//
//  Created by Abul Kashem on 19/1/23.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var collageNameLabel: UILabel!
    @IBOutlet weak var studentAddressNameLabel: UILabel!
    @IBOutlet weak var studentEmailLabel: UILabel!
    
    var student: Student? {
        didSet{
            studentNameLabel.text = "Name : \(student?.name ?? "")"
            collageNameLabel.text = "Collage : \(student?.collage ?? "")"
            studentAddressNameLabel.text = "Address : \(student?.address ?? "")"
            studentEmailLabel.text = "Email : \(student?.email ?? "")"

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
