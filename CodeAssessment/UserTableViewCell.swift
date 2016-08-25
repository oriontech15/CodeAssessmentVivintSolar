//
//  UserTableViewCell.swift
//  CodeAssessment
//
//  Created by Justin Smith on 8/25/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var userImageView: UserImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateWithUser(user: User) {
        self.nameLabel.text = user.firstName + " " + user.lastName
        self.emailLabel.text = "Email: \(user.email)"
        self.phoneLabel.text = "Phone: \(user.phoneNumber)"
        if let imageURL = NSURL(string: user.imageURL) {
            ImageController.fetchImageForImageURL(imageURL) { (image) in
                if let image = image {
                    self.userImageView.image = image
                }
            }
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
