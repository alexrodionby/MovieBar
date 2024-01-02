//
//  AvatarLineView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 25.12.23.
//

import SwiftUI

struct AvatarLineView: View {
    
    var userProfile: UserProfileModel?
    var helloText = LocalizedStringKey("Hello, ")
    @ObservedObject var wishListVM: WishlistViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            AvatarCircleView(avatarFrameSize: 40, imageFrameSize: 24, backgroundColor: .custom.secondaryOrange, personImage: Image(.person), imagePersonColor: .custom.textWhite)
            HStack(spacing: 0) {
                Text(helloText)
                Text(userProfile?.name ?? "Guest")
            }
            .foregroundStyle(Color.custom.textWhite)
            .font(.custom(.semiBold, size: 16))
            
            Spacer()
            
            NavigationLink {
                // Переход на экран избранных филмов
                WishListView(wishlistVM: wishListVM, screenTitle: "Wish List")
            } label: {
                LikeHeartView(heartFrameCornerRadius: 12, heartFrameSize: 32, heartImageSize: 24, heartImageColor: .custom.secondaryRed, backgroundColor: .custom.primarySoft, heartImage: Image(.heart))
            }
        }
    }
}

#Preview {
    AvatarLineView(wishListVM: WishlistViewModel())
}
