//
//  LikeHeartView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 24.12.23.
//

import SwiftUI

struct LikeHeartView: View {
    
    var heartFrameCornerRadius: CGFloat = 12
    var heartFrameSize: CGFloat = 32
    var heartImageSize: CGFloat = 24
    var heartImageColor: Color = .custom.secondaryRed
    var backgroundColor: Color = .custom.primarySoft
    var heartImage: Image = Image(.heart)
    
    var body: some View {
        RoundedRectangle(cornerRadius: heartFrameCornerRadius, style: .continuous)
            .fill(backgroundColor)
            .frame(width: heartFrameSize, height: heartFrameSize)
            .overlay(
                heartImage
                    .resizable()
                    .frame(width: heartImageSize, height: heartImageSize)
                    .foregroundColor(heartImageColor)
            )
    }
}

#Preview {
    LikeHeartView()
        .frame(width: 100, height: 100)
}
