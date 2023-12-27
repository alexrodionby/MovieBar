//
//  MovieVericalMainView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 26.12.23.
//

import SwiftUI
import Kingfisher

struct MovieVericalMainView: View {
    
    var movieByCategory: MovieDetail
    
    var cellWidth: CGFloat = 155
    var cellHeight: CGFloat = 280
    var cellCornerRadius: CGFloat = 16
    var titleLineLimit: Int = 2
    var textPadding: CGFloat = 8
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            KFImage(URL(string: movieByCategory.poster?.previewURL ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: cellWidth, height: cellHeight - 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movieByCategory.name ?? "No movie name")
                    .font(.custom(.semiBold, size: 14))
                    .foregroundStyle(Color.custom.textWhite)
                    .lineLimit(titleLineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .padding(.horizontal, textPadding)
                
                Text(movieByCategory.genres?[0].name ?? "No genre")
                    .font(.custom(.medium, size: 10))
                    .foregroundStyle(Color.custom.textGray)
                    .lineLimit(titleLineLimit - 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .padding(.horizontal, textPadding)
            }
            Spacer()
        }
        .frame(width: cellWidth, height: cellHeight)
        .background(Color.custom.primarySoft)
        .clipShape(RoundedRectangle(cornerRadius: cellCornerRadius))
        .overlay(alignment: .topTrailing) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundStyle(Color.custom.secondaryOrange)
                Text(String(format: "%.1f", movieByCategory.rating?.kp ?? 0.0))
                    .font(.custom(.semiBold, size: 16))
                    .foregroundStyle(Color.custom.secondaryOrange)
            }
            .padding(4)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .blur(radius: 5)
                    .foregroundColor(Color.black.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            )
            .padding(8)
        }
    }
}

#Preview {
    MovieVericalMainView(movieByCategory: MovieDetail.init())
}
