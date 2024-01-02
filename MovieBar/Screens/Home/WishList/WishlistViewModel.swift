//
//  WishlistViewModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import Foundation

class WishlistViewModel: ObservableObject {
    @Published var wishList: [MovieDetail]?
    
    init() {
        updateWishListState()
    }
    
    func saveToWishList(movie: MovieDetail) {
        StorageService.shared.saveToWishList(movie: movie)
        self.wishList = StorageService.shared.wishList
    }
    
    func removeFromWishList(movie: MovieDetail) {
        StorageService.shared.removeFromWishList(movie: movie)
        self.wishList = StorageService.shared.wishList
    }
    
    func updateWishListState() {
        self.wishList = StorageService.shared.wishList
    }
}
