//
//  CustomBackButton.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 28.12.23.
//

import SwiftUI

struct CustomBackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var backButtonCornerRadius: CGFloat = 12
    var backButtonFrameSize: CGFloat = 32
    var backButtonImageSize: CGFloat = 24
    var backButtonColor: Color = .custom.textWhite
    var backgroundColor: Color = .custom.primarySoft
    var backButtonImage: Image = Image(.arrowback)
    
    var body: some View {
        RoundedRectangle(cornerRadius: backButtonCornerRadius, style: .continuous)
            .fill(backgroundColor)
            .frame(width: backButtonFrameSize, height: backButtonFrameSize)
            .overlay(
                backButtonImage
                    .resizable()
                    .frame(width: backButtonImageSize, height: backButtonImageSize)
                    .foregroundColor(backButtonColor)
            )
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

#Preview {
    CustomBackButton()
}
