//
//  DetailedMovieCellView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 28.12.23.
//

import SwiftUI
import Kingfisher

struct DetailedMovieCellView<Content: View>: View {
    
    var movieDetail: MovieDetail
    
    var cellWidth: CGFloat = 155
    var cellHeight: CGFloat = 230
    var cellCornerRadius: CGFloat = 16
    var titleLineLimit: Int = 4
    var textPadding: CGFloat = 8
    var goToAction: (() -> Content)?
    
    var body: some View {
        HStack(spacing: 10) {
            
            NavigationLink {
                goToAction?()
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    KFImage(URL(string: movieDetail.poster?.previewURL ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: cellWidth, height: cellHeight)
                    
                }
                .frame(width: cellWidth, height: cellHeight)
                .clipShape(RoundedRectangle(cornerRadius: cellCornerRadius))
                .overlay(alignment: .topTrailing) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.custom.secondaryOrange)
                        Text(String(format: "%.1f", movieDetail.rating?.kp ?? 0.0))
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

            VStack(alignment: .leading, spacing: 16) {
                Text(movieDetail.name ?? "No movie name")
                    .font(.custom(.semiBold, size: 16))
                    .foregroundStyle(Color.custom.textWhite)
                    .lineLimit(titleLineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .padding(.horizontal, textPadding)
        
                HStack(alignment: .center, spacing: textPadding) {
                    Image("calendar")
                        .resizable()
                        .frame(width: cellHeight / 10, height: cellHeight / 10)
                        .foregroundStyle(Color.custom.textGray)
                    
                    Text(String(movieDetail.year ?? 2023))
                        .font(.custom(.medium, size: 14))
                        .foregroundStyle(Color.custom.textGray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                        .padding(.horizontal, textPadding)
                }
                
                HStack(alignment: .center, spacing: textPadding) {
                    Image("clock")
                        .resizable()
                        .frame(width: cellHeight / 10, height: cellHeight / 10)
                        .foregroundStyle(Color.custom.textGray)
                    
                    HStack {
                        HStack(spacing: 4) {
                            Text(String(movieDetail.movieLength ?? 90))
                            Text("minutes")
                            Text(" ")
                            AgeRatingView(age: movieDetail.ageRating ?? 0)
                        }
                        .font(.custom(.medium, size: 14))
                        .foregroundStyle(Color.custom.textGray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                        .padding(.horizontal, textPadding)
                    }
                }
                
                HStack(alignment: .center, spacing: textPadding) {
                    Image("film")
                        .resizable()
                        .frame(width: cellHeight / 10, height: cellHeight / 10)
                        .foregroundStyle(Color.custom.textGray)
                    
                    HStack {
                        Text(movieDetail.genres?[0].name ?? "No genre")
                        Text("|")
                        Text(movieDetail.type?.rawValue ?? "No type")
                    }
                        .font(.custom(.medium, size: 14))
                        .foregroundStyle(Color.custom.textGray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                        .padding(.horizontal, textPadding)
                }
            }
        }
    }
}

#Preview {
    DetailedMovieCellView<EmptyView>(movieDetail: MovieDetail())
}
