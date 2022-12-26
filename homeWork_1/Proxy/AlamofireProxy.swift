//
//  AlamofireProxy.swift
//  homeWork_1
//
//  Created by Aleksandr Derevenskih on 26.12.2022.
//  Copyright © 2022 Марат Нургалиев. All rights reserved.
//

import Foundation

class AlamofireProxy: VkApiInterface {
    private let vkApiService: VkApiInterface

    // MARK: - Initializers
    init(vkApiService: VkApiInterface) {
        self.vkApiService = vkApiService
    }

    // MARK: - Public methods
    func getFriends(delegate: VkApiFriendsDelegate) {
        print ("getFriends request")
        return vkApiService.getFriends(delegate: delegate)
    }

    func getGroups(delegate: VkApiGroupsDelegate) {
        print ("getGroups request")
        return vkApiService.getGroups(delegate: delegate)
    }

    func leaveGroup(gid: Int, delegate: VkApiGroupsDelegate) {
        print ("leaveGroup:\(gid) request")
        return vkApiService.leaveGroup(gid: gid, delegate: delegate)
    }

    func joinGroup(gid: Int, delegate: VkApiGroupsDelegate) {
        print ("joinGroup:\(gid) request")
        return vkApiService.joinGroup(gid: gid, delegate: delegate)
    }

    func getNews(startFrom: String, delegate: VkApiFeedsDelegate) {
        print ("getNews:\(startFrom) request")
        return vkApiService.getNews(startFrom: startFrom, delegate: delegate)
    }

    func getPhotos(delegate: VkApiPhotosDelegate) {
        print ("getPhotos request")
        return vkApiService.getPhotos(delegate: delegate)
    }

    func getPhotosBy(_ id: Int, delegate: VkApiPhotosDelegate) {
        print ("getPhotosBy:\(id) request")
        return vkApiService.getPhotosBy(id, delegate: delegate)
    }

    func searchGroups(search: String, delegate: VkApiGroupsDelegate) {
        print ("searchGroups:\(search) request")
        return vkApiService.searchGroups(search: search, delegate: delegate)
    }

    func getComments(ownerId: Int, postId: Int, delegate: VkApiCommentsDelegate) {
        print ("getComments ownerId:\(ownerId), postId:\(postId) request")
        return vkApiService.getComments(ownerId: ownerId, postId: postId, delegate: delegate)
    }
}
