//
//  FullMovieView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 6.01.24.
//

import SwiftUI

struct FullMovieView: View {
    
    var movie: MovieDetail
    
    var body: some View {
        VStack {
            WebView(url: URL(string: "https://www.kinopoisk.vip/film/\(movie.id ?? 0)/")!)
            Spacer()
        }
    }
}

#Preview {
    FullMovieView(movie: MovieDetail())
}
