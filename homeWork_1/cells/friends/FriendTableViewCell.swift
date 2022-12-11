//
//  FriendTableViewCell.swift
//  homeWork_1
//
//  Created by User on 30.09.2018.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit
import SDWebImage

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageAva: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func load(_ viewModel: FriendViewModel) {
        labelName.text = viewModel.name

        if let photoUrl = viewModel.photoUrl {
            imageAva.sd_setImage(with: photoUrl, placeholderImage: viewModel.placeholderImage)
        }
    }
}
