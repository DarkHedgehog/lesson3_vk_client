//
//  CommentTableViewCell.swift
//  homeWork_1
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewAva: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func load(_ viewModel: CommentViewModel) {
        labelName.text = viewModel.name
        labelText.text = viewModel.text
        imageViewAva.sd_setImage(with: viewModel.imageUrl, placeholderImage: viewModel.placeholderImage)
    }


}
