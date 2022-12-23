//
//  NewsViewModelFactory.swift
//  homeWork_1
//
//  Created by Aleksandr Derevenskih on 12.12.2022.
//  Copyright © 2022 Марат Нургалиев. All rights reserved.
//

import UIKit

class NewsViewModelFactory {

    func constructViewModel(from feed: VkFeed) -> NewsViewModel {
        return NewsViewModel(date: feed.getFeedDate(),
                             groupHeader: feed.sourceName,
                             feedText: feed.feedText,
                             likesCountText: feed.getStringFrom(count: feed.countLikes),
                             viewsCountText: feed.getStringFrom(count: feed.countViews),
                             sharesCountText: feed.getStringFrom(count: feed.countReposts),
                             commentCountText: feed.getStringFrom(count: feed.countComments),
                             sourceUrl: URL(string: feed.sourceUrl),
                             placeholderImage: UIImage.vkImage.noPhotoImage,
                             attachmentsHeightMultipler: calcHeight(from: feed.attachments),
                             attachmentsUrls: feed.attachments.compactMap { URL(string: $0.imageUrl) })
    }

    private func calcHeight(from attachments: [VkAttachment]) -> CGFloat {
        if attachments.count > 0 {
            return CGFloat(attachments[0].height) / CGFloat(attachments[0].width)
        } else {
            return CGFloat(0)
        }
    }
}

