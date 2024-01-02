//
//  WishlistCellView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI
import Kingfisher

struct WishlistCellView: View {
    
    var movie: MovieDetail
    
    var cellWidth: CGFloat = 100
    var cellHeight: CGFloat = 180
    var cellCornerRadius: CGFloat = 16
    var titleLineLimit: Int = 4
    var textPadding: CGFloat = 8
    var tapLikeAction: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 0) {
            
            NavigationLink {
                DetailMovieView(movie: movie)
            } label: {
                KFImage(URL(string: movie.poster?.previewURL ?? ""))
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: cellCornerRadius))
                    .padding(10)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.name ?? "No name")
                    .font(.custom(.semiBold, size: 18))
                    .foregroundStyle(Color.custom.textWhite)
                    .lineLimit(titleLineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .padding(.horizontal, textPadding)
                
                Text(movie.type?.rawValue ?? "No movie type")
                    .font(.custom(.medium, size: 14))
                    .foregroundStyle(Color.custom.textWhiteGray)
                    .lineLimit(titleLineLimit - 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .padding(.horizontal, textPadding)
                
                Text(movie.genres?[0].name ?? "No genre")
                    .font(.custom(.medium, size: 14))
                    .foregroundStyle(Color.custom.textWhiteGray)
                    .lineLimit(titleLineLimit - 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .padding(.horizontal, textPadding)
                
                Text(movie.description ?? "No description")
                    .font(.custom(.medium, size: 12))
                    .foregroundStyle(Color.custom.textGray)
                    .lineLimit(titleLineLimit * 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .padding(.horizontal, textPadding)
                
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.custom.secondaryOrange)
                        Text(String(format: "%.1f", movie.rating?.kp ?? 0.0))
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
                    
                    Spacer()
                    
                    Button(action: {
                        print("Удаляем из избранного")
                        tapLikeAction?()
                    }, label: {
                        LikeHeartView()
                    })
                    
                }
            }
            .padding()
        }
        .background(Color.custom.primarySoft)
        .clipShape(RoundedRectangle(cornerRadius: cellCornerRadius))
    }
}

#Preview {
    WishlistCellView(movie: MovieDetail())
}
