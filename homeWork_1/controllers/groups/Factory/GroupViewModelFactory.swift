//
//  GroupViewModelFactory.swift
//  homeWork_1
//
//  Created by Aleksandr Derevenskih on 11.12.2022.
//  Copyright © 2022 Марат Нургалиев. All rights reserved.
//

import UIKit

class GroupViewModelFactory {

    func constructViewModel(from group: VkGroup) -> GroupViewModel {
        return GroupViewModel(name: group.name,
                              type: group.getType(),
                              member: group.is_member > 0 ? "Вы вступили" : "",
                              placeholderImage: UIImage.vkImage.noPhotoImage,
                              photoUrl: (group.photo.count > 0) ? URL(string: group.photoBig) : nil)
    }
}
