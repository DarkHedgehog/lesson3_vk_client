//
//  NewsViewModel.swift
//  homeWork_1
//
//  Created by Aleksandr Derevenskih on 12.12.2022.
//  Copyright © 2022 Марат Нургалиев. All rights reserved.
//

import UIKit

struct NewsViewModel {
    var date: String
    var groupHeader: String
    var feedText: String
    var likesCountText: String
    var viewsCountText: String
    var sharesCountText: String
    var commentCountText: String
    var sourceUrl: URL?
    var placeholderImage: UIImage?
    var attachmentsHeightMultipler: CGFloat
    var attachmentsUrls: [URL]
}
