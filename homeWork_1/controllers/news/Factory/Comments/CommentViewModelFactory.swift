//
//  CommentViewModelFactory.swift
//  homeWork_1
//
//  Created by Aleksandr Derevenskih on 12.12.2022.
//  Copyright © 2022 Марат Нургалиев. All rights reserved.
//

import UIKit

class CommentViewModelFactory {
    
    func constructViewModel(from comment: VkComment) -> CommentViewModel {
        return CommentViewModel(name: comment.sender.getFullName(),
                                text: comment.text,
                                imageUrl: URL(string: comment.sender.imageUrl100),
                                placeholderImage: UIImage.vkImage.noPhotoImage)
    }
}
