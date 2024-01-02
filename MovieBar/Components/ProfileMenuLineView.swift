//
//  ProfileMenuLineView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct ProfileMenuLineView: View {
    
    var leftImage: Image = Image(.notification)
    var leftImageColor: Color = .custom.textGray
    var imageFrameCornerRadius: CGFloat = 15
    var backgroundColor = Color.custom.primarySoft
    var imageFrameSize: CGFloat = 30
    var imageSelfSize: CGFloat = 24
    var lineText: String = "Notification"
    var rightImage: Image = Image(.arrowback)
    var rightImageColor: Color = .custom.primaryBlueAccent
    var titleLineLimit: Int = 1
    var textPadding: CGFloat = 8
    var rotation: Bool = true
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: imageFrameCornerRadius, style: .continuous)
                .fill(backgroundColor)
                .frame(width: imageFrameSize, height: imageFrameSize)
                .overlay(
                    leftImage
                        .resizable()
                        .frame(width: imageSelfSize, height: imageSelfSize)
                        .foregroundColor(leftImageColor)
                )
            
            Text(lineText)
                .font(.custom(.medium, size: 14))
                .foregroundStyle(Color.custom.textWhite)
                .lineLimit(titleLineLimit)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .truncationMode(.tail)
                .padding(.horizontal, textPadding)
            
            rightImage
                .resizable()
                .rotationEffect(rotation ? .degrees(180) : .zero)
                .frame(width: imageSelfSize, height: imageSelfSize)
                .foregroundColor(rightImageColor)
        }
    }
}

#Preview {
    ProfileMenuLineView()
}
