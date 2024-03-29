//
//  TrailerButtonView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 29.12.23.
//

import SwiftUI

struct TrailerButtonView: View {
    
    var labelTrailerText: LocalizedStringKey = LocalizedStringKey("Trailer")
    var trailerButtonCornerRadius: CGFloat = 32
    var backgroundColor: Color = .custom.secondaryOrange
    var trailerButtonHeigth: CGFloat = 50
    var trailerButtonImage: Image = Image(.film)
    var trailerButtonImageSize: CGFloat = 24
    var trailerButtonColor: Color = .custom.textWhite
    var tapTrailerAction: (() -> Void)?
    
    var body: some View {
        Button(action: {
            tapTrailerAction?()
        }, label: {
            RoundedRectangle(cornerRadius: trailerButtonCornerRadius, style: .continuous)
                .fill(backgroundColor)
                .frame(width: trailerButtonHeigth * 2.5, height: trailerButtonHeigth)
                .overlay(
                    HStack {
                        trailerButtonImage
                            .resizable()
                            .frame(width: trailerButtonImageSize, height: trailerButtonImageSize)
                        Text(labelTrailerText)
                            .font(.custom(.semiBold, size: 16))
                    }
                        .foregroundColor(trailerButtonColor)
                )
        })
    }
}

#Preview {
    TrailerButtonView()
}
