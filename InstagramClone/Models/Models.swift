//
//  Models.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/26.
//

import Foundation

enum Gender {
    case male, femail, other
}

struct User {
    let username: String
    let name: (first: String, last: String)
    let profilePhoto: URL
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType: String {
    case photo = "Photo"
    case video = "Video"
}

public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL // either video url or full resolution photo
    let caption: String?
    let likeCount: [PostLikes]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
    let owner: User
}

struct PostLikes {
    let username: String
    let postIdentifier: String
}

struct CommentLikes {
    let username: String
    let commentIdentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLikes]
}


