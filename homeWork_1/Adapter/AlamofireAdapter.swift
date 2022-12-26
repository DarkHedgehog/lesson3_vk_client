//
//  AlamofireAdapter.swift
//  homeWork_1
//
//  Created by Aleksandr Derevenskih on 11.12.2022.
//  Copyright © 2022 Марат Нургалиев. All rights reserved.
//

import Foundation

class AlamofireAdapter {
    private let alamofireService: VkApiInterface
    static let instance = AlamofireAdapter()

    // MARK: - Initializers
    private init() {
        alamofireService = AlamofireProxy(vkApiService: AlamofireService.instance)
    }

    // MARK: - Public methods

    func getFriends(_ closure: @escaping ([VkFriend]) -> Void ) {
        alamofireService.getFriends(delegate: VkApiFriendsAdapter(closure))
    }

    func getPhotos(_ closure: @escaping ([VkPhoto]) -> Void ) {
        alamofireService.getPhotos(delegate: VkApiPhotosAdapter(closure))
    }

    func getPhotosBy(_ id: Int, _ closure: @escaping ([VkPhoto]) -> Void ) {
        alamofireService.getPhotosBy(id, delegate: VkApiPhotosAdapter(closure))
    }

    func search(groups text:String, _ closure: @escaping ([VkGroup]) -> Void ) {
        alamofireService.searchGroups(search: text, delegate: VkApiGroupAdapter(closure))
    }

    func getGroups(_ closure: @escaping ([VkGroup]) -> Void ) {
        alamofireService.getGroups(delegate: VkApiGroupAdapter(closure))
    }

    func leaveGroup(_ gid: Int, _ closure: @escaping (_ gid: Int?, _ error: String?) -> Void) {
        alamofireService.leaveGroup(gid: gid, delegate: VkApiGroupAdapter(closure))
    }

    func joinGroup(_ gid: Int, _ closure: @escaping (_ gid: Int?, _ error: String?) -> Void) {
        alamofireService.joinGroup(gid: gid, delegate: VkApiGroupAdapter(closure))
    }

    func getNews(startFrom: String, _ closure: @escaping ([VkFeed]) -> Void) {
        alamofireService.getNews(startFrom: startFrom, delegate: VkApiFeedsAdapter(closure))
    }

    func getComments(ownerId: Int, postId: Int, _ closure: @escaping ([VkComment]) -> Void) {
        alamofireService.getComments(ownerId: ownerId, postId: postId, delegate: VkApiComentsAdapter(closure))
    }

    // MARK: - Types

    class VkApiComentsAdapter: VkApiCommentsDelegate {
        var closure: ([VkComment]) -> Void
        init(_ closure: @escaping ([VkComment]) -> Void) {
            self.closure = closure
        }
        func returnComments(_ comments: [VkComment]) {
            closure(comments)
        }
    }

    class VkApiFeedsAdapter: VkApiFeedsDelegate {
        var closure: ([VkFeed]) -> Void
        init(_ closure: @escaping ([VkFeed]) -> Void) {
            self.closure = closure
        }
        func returnFeeds(_ feeds: [VkFeed]) {
            closure(feeds)
        }
    }

    class VkApiFriendsAdapter: VkApiFriendsDelegate {
        var closure: ([VkFriend]) -> Void
        init(_ closure: @escaping ([VkFriend]) -> Void) {
            self.closure = closure
        }
        func returnFriends(_ friends: [VkFriend]) {
            closure(friends)
        }
    }

    class VkApiPhotosAdapter: VkApiPhotosDelegate {
        var closure: ([VkPhoto]) -> Void
        init(_ closure: @escaping ([VkPhoto]) -> Void) {
            self.closure = closure
        }
        func returnPhotos(_ photos: [VkPhoto]) {
            closure(photos)
        }
    }

    class VkApiGroupAdapter: VkApiGroupsDelegate {
        var groupsClosure: (([VkGroup]) -> Void)?
        var intClosure: ((Int?, String?) -> Void)?

        init(_ closure: @escaping ([VkGroup]) -> Void) {
            self.groupsClosure = closure
            self.intClosure = nil
        }
        init(_ closure: @escaping (_ gid: Int?, _ error: String?) -> Void) {
            self.groupsClosure = nil
            self.intClosure = closure
        }

        func returnGroups(_ groups: [VkGroup]) {
            groupsClosure?(groups)
        }
        func returnLeave(_ gid: Int) {
            intClosure?(gid, nil)
        }
        func returnLeave(_ error: String) {
            intClosure?(nil, error)
        }
        func returnJoin(_ gid: Int) {
            intClosure?(gid, nil)
        }
        func returnJoin(_ error: String) {
            intClosure?(nil, error)
        }
    }
}
