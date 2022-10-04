//
//  PostModel.swift
//  FacebookClone
//
//  Created by Muhammad Zikri Mohd Yunan on 19/09/2022.
//

import UIKit

class PostModel: NSObject {
    var profileImage: String?
    var name: String?
    var postDate: String?
    var postMessage: String?
    var likes: String?
    var comments: String?
    var shares: String?
    
    init(profileImage: String,name: String,postDate: String,postMessage: String,likes: String,comments: String,shares: String) {
        self.profileImage = profileImage
        self.name = name
        self.postDate = postDate
        self.postMessage = postMessage
        self.likes = likes
        self.comments = comments
        self.shares = shares
    }
}
