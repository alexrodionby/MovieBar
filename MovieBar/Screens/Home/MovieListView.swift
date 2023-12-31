//
//  MovieListView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 28.12.23.
//

import SwiftUI

struct MovieListView: View {
    
    var movies: [MovieDetail]?
    var screenTitle: String = ""
    var scrollViewAxis: Axis.Set = .vertical
    var shshowScrollIndicators: Bool = false
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack {
                ScrollView(scrollViewAxis, showsIndicators: shshowScrollIndicators) {
                    ForEach(movies ?? [], id: \.id) { movie in
                        DetailedMovieCellView(movieDetail: movie) {
                            DetailMovieView(movie: movie)
                        }
                        .padding(8)
                    }
                }
                Spacer()
            }
        }
        .navigationTitle(screenTitle)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    MovieListView()
}
