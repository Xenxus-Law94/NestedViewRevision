//
//  ChildListItemTableViewCell.swift
//  Nested Table View
//
//  Created by tunlukhant on 9/15/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import UIKit

class ChildListItemTableViewCell: UITableViewCell {

    static let identifier = "ChildListItemTableViewCell"
    
    @IBOutlet weak var ivChild: UIImageView!
    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    var child: ChildVO? {
        didSet {
            if let child = child {
                lblStudentName.text = child.childName
                lblGender.text = child.gender
                if child.gender == "Male" {
                    ivChild.image = UIImage(named: "boy")
                } else {
                    ivChild.image = UIImage(named: "girls")
                }
                
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
