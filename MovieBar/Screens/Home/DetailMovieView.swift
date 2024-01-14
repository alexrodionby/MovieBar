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
    @State private var goToTrailerView = false
    @State private var goToFullMovie = false
    
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
                    
                    HStack(spacing: 16) {
                        TrailerButtonView() {
                            print("Нажали трейлер")
                            goToTrailerView = true
                        }
                        ShareButtonView() {
                            print("Нажали поделиться")
                            ShareId(infoString: String(movie.videos?.trailers?.first?.url ?? "No link"))
                        }
                        
                        
                        NavigationLink {
                            FullMovieView(movie: movie)
                        } label: {
                            RoundedRectangle(cornerRadius: 32, style: .continuous)
                                .fill(Color.custom.primaryBlueAccent)
                                .frame(width: 50 * 2.5, height: 50)
                                .overlay(
                                    HStack {
                                        Image(.film)
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("Full")
                                            .font(.custom(.semiBold, size: 16))
                                    }
                                        .foregroundColor(.custom.textWhite)
                                )
                        }

                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 8) {
                        Text("Discription")
                            .font(.custom(.semiBold, size: 16))
                            .foregroundStyle(Color.custom.textWhite)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ScrollView(.vertical, showsIndicators: false) {
                            Text(movie.description ?? "No discription")
                                .font(.custom(.medium, size: 14))
                                .foregroundStyle(Color.custom.textWhiteGray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.horizontal)
                }
                .background {
                    KFImage(URL(string: movie.poster?.url ?? ""))
                        .resizable()
                        .scaledToFill()
                        .opacity(0.1)
                        .blur(radius: 1.0)
                        .ignoresSafeArea()
                }
                
                if goToTrailerView {
                    NavigationLink(
                        destination: TrailerMainView(movie: movie),
                        isActive: $goToTrailerView
                    ) {
                        EmptyView()
                    }
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
    
    func ShareId(infoString: String) {
        let info = infoString
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let av = UIActivityViewController(activityItems: [info], applicationActivities: nil)
            windowScene.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        }
    }
    
}

#Preview {
    DetailMovieView(movie: MovieDetail())
}
