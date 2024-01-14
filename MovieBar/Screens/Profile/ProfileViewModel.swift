//
//  ProfileViewModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: UserProfileModel?
    
    init() {
        loadCurrentUser()
    }
    
    func loadCurrentUser() {
        loadUser(name: "currentUsername")
    }
    
    func loadUser(name: String) {
        let user = StorageService.shared.loadUserProfile(username: name)
        currentUser = user
    }
    
    func saveUser(user: UserProfileModel) {
        StorageService.shared.saveUserProfile(profile: user, username: user.name)
        currentUser = user
        StorageService.shared.saveUserProfile(profile: user, username: "currentUsername")
    }
}
