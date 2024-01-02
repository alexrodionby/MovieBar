//
//  StorageService.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 23.12.23.
//

import Foundation

final class StorageService {
    
    static let shared: StorageService = .init()
    
    var wishList: [MovieDetail]?
    var currentUser: UserProfileModel?
    
    private init(wishList: [MovieDetail]? = nil) {
        self.wishList = load(key: "wishlist")
        self.currentUser = loadUserProfile(username: "currentUsername")
    }
    
    // MARK: - public methods for saving / loading
    
    func saveToWishList(movie: MovieDetail) {
        var movies: [MovieDetail] = load(key: "wishlist") ?? []
        movies.append(movie)
        save(movies, key: "wishlist")
        self.wishList = movies
    }
    
    func removeFromWishList(movie: MovieDetail) {
        var movies: [MovieDetail] = load(key: "wishlist") ?? []
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies.remove(at: index)
            save(movies, key: "wishlist")
            self.wishList = movies
        }
    }
    
    func saveUserProfile(profile: UserProfileModel, username: String) {
            do {
                let data = try JSONEncoder().encode(profile)
                UserDefaults.standard.set(data, forKey: keyForUserProfile(username))
                currentUser = profile
            } catch {
                print("UserProfileModel saving failed: \(error)")
            }
        }
        
        func loadUserProfile(username: String) -> UserProfileModel? {
            guard let data = UserDefaults.standard.data(forKey: keyForUserProfile(username)) else { return nil }
            do {
                let profile = try JSONDecoder().decode(UserProfileModel.self, from: data)
                return profile
            } catch {
                print("UserProfileModel loading failed: \(error)")
                return nil
            }
        }
    
    private func keyForUserProfile(_ username: String) -> String {
           return "userProfile_\(username)"
       }
    
    // MARK: - private save / load methods
    
    private func save<T: Codable>(_ object: T, key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("\(T.self) saving failed: \(error)")
        }
    }
    
    private func load<T: Codable>(key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            print("\(T.self) loading failed: \(error)")
            return nil
        }
    }
}
