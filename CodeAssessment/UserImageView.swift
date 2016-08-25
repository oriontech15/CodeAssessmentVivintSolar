//
//  UserImageView.swift
//  CodeAssessment
//
//  Created by Justin Smith on 8/25/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import UIKit

class UserImageView: UIImageView {

    var cornerRadius: CGFloat {
        return self.frame.height / 2.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupImageView()
    }
    
    func setupImageView() {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
