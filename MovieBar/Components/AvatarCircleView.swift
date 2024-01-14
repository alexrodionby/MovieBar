//
//  AvatarCircleView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 24.12.23.
//

import SwiftUI

struct AvatarCircleView: View {
    
    var avatarFrameSize: CGFloat = 50
    var imageFrameSize: CGFloat = 30
    var backgroundColor: Color = .custom.secondaryOrange
    var personImage: Image = Image(.person)
    var imagePersonColor: Color = .custom.textWhite
    
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .frame(width: avatarFrameSize, height: avatarFrameSize)
            .overlay(
                personImage
                    .resizable()
                    .frame(width: imageFrameSize, height: imageFrameSize)
                    .foregroundColor(imagePersonColor)
            )
    }
}

#Preview {
    AvatarCircleView()
        .frame(width: 100, height: 100)
}
