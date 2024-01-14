//
//  ShareButtonView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 29.12.23.
//

import SwiftUI

struct ShareButtonView: View {
    
    var shareButtonCornerRadius: CGFloat = 24
    var shareButtonFrameSize: CGFloat = 48
    var shareButtonImageSize: CGFloat = 20
    var shareButtonColor: Color = .custom.primaryBlueAccent
    var backgroundColor: Color = .custom.primarySoft
    var shareButtonImage: Image = Image(.share)
    var tapShareAction: (() -> Void)?
    
    var body: some View {
        Button(action: {
            tapShareAction?()
        }, label: {
            RoundedRectangle(cornerRadius: shareButtonCornerRadius, style: .continuous)
                .fill(backgroundColor)
                .frame(width: shareButtonFrameSize, height: shareButtonFrameSize)
                .overlay(
                    HStack {
                        shareButtonImage
                            .resizable()
                            .frame(width: shareButtonImageSize, height: shareButtonImageSize)
                    }
                        .foregroundColor(shareButtonColor)
                )
        })
    }
}

#Preview {
    ShareButtonView()
}
