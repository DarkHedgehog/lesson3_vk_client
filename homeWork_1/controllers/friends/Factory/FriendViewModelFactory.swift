//
//  GroupViewModelFactory.swift
//  homeWork_1
//
//  Created by Aleksandr Derevenskih on 11.12.2022.
//  Copyright © 2022 Марат Нургалиев. All rights reserved.
//

import UIKit

class FriendViewModelFactory {

    func constructViewModel(from friend: VkFriend) -> FriendViewModel {
        return FriendViewModel(name: friend.full_name,
                              placeholderImage: UIImage.vkImage.noPhotoImage,
                              photoUrl: (friend.photo.count > 0) ? URL(string: friend.photo) : nil)
    }
}
