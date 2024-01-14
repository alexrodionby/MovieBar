//
//  UserProfileModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import Foundation

struct UserProfileModel: Codable {
    var name: String
    var email: String
    var avatar: String?
}
