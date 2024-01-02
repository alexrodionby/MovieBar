//
//  DetailMovieView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 29.12.23.
//

import SwiftUI
import Kingfisher

struct DetailMovieView: View {
    
    var movie: MovieDetail
    
    var cellWidth: CGFloat = 200
    var cellHeight: CGFloat = 230
    var cellCornerRadius: CGFloat = 16
    var textPadding: CGFloat = 8
    
    init(movie: MovieDetail) {
        self.movie = movie
    }
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    KFImage(URL(string: movie.poster?.url ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: cellWidth)
                        .clipShape(RoundedRectangle(cornerRadius: cellCornerRadius))
                    
                    HStack(alignment: .center, spacing: textPadding) {
                        Spacer()
                        
                        Image("calendar")
                            .resizable()
                            .frame(width: cellHeight / 10, height: cellHeight / 10)
                        
                        Text(String(movie.year ?? 2023))
                            .font(.custom(.medium, size: 16))
                        
                        Image("clock")
                            .resizable()
                            .frame(width: cellHeight / 10, height: cellHeight / 10)
                        
                        Text(String(movie.movieLength ?? 90))
                        
                        Text("minutes")
                        
                        Image("film")
                            .resizable()
                            .frame(width: cellHeight / 10, height: cellHeight / 10)
                        
                        Text(movie.type?.rawValue ?? "No type")
                        
                        Spacer()
                    }
                    .foregroundStyle(Color.custom.textGray)
                    
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
                    
                    HStack(spacing: 48) {
                        TrailerButtonView()
                        ShareButtonView()
                    }
                    
                }
                .background {
                    KFImage(URL(string: movie.poster?.url ?? ""))
                        .resizable()
                        .scaledToFill()
                        .opacity(0.1)
                        .blur(radius: 1.0)
                        .ignoresSafeArea(edges: .top)
                }
                
                Spacer()
            }
        }
        .onAppear {
            StorageService.shared.saveToRecentList(movie: movie)
        }
        .navigationBarItems(trailing: Button(action: {
            print("Нажали на Добавить в избранное")
            StorageService.shared.saveToWishList(movie: movie)
        }) {
            LikeHeartView()
        })
        .navigationTitle("Detail")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    DetailMovieView(movie: MovieDetail())
}
