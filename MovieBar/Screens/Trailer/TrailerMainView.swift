//
//  TrailerMainView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 6.01.24.
//

import SwiftUI
import YouTubePlayerKit

struct TrailerMainView: View {
    
    var movie: MovieDetail
    
    var textPadding: CGFloat = 8
    var cellWidth: CGFloat = 200
    var cellHeight: CGFloat = 230
    var screenTitle: LocalizedStringKey = LocalizedStringKey("Trailer")
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.custom.primaryDark
                    .ignoresSafeArea()
                
                VStack {
                    YouTubePlayerView(
                        YouTubePlayer(source: .url(movie.videos?.trailers?[0].url ?? ""), configuration: .init(autoPlay: true)),
                        placeholderOverlay: {
                            ProgressView()
                        }
                    )
                    .frame(width: geometry.size.width - 32, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
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
                    
                    VStack(alignment: .leading) {
                        Text(movie.name ?? "No name" )
                            .font(.custom(.bold, size: 18))
                            .foregroundStyle(Color.custom.textWhite)
                            .lineLimit(2)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            Text(movie.description ?? "No discription")
                                .font(.custom(.medium, size: 14))
                                .foregroundStyle(Color.custom.textWhiteGray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle(screenTitle)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
        }
    }
}

#Preview {
    TrailerMainView(movie: MovieDetail())
}
