//
//  WishListView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct WishListView: View {
    
    @ObservedObject var wishlistVM: WishlistViewModel
    var screenTitle: String = ""
    var scrollViewAxis: Axis.Set = .vertical
    var shshowScrollIndicators: Bool = false
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack {
                ScrollView(scrollViewAxis, showsIndicators: shshowScrollIndicators) {
                    ForEach(wishlistVM.wishList ?? [], id: \.id) { movie in
                        WishlistCellView(movie: movie) {
                            wishlistVM.removeFromWishList(movie: movie)
                        }
                        .padding(8)
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            wishlistVM.updateWishListState()
        }
        .navigationTitle(screenTitle)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    WishListView(wishlistVM: WishlistViewModel())
}
