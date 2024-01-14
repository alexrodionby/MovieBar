//
//  MovieByCategoryCollectionView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 26.12.23.
//

import Foundation
import SwiftUI

struct MovieByCategoryCollectionView: View {
    
    var movies: MovieBigModel
    var scrollViewAxis: Axis.Set = .horizontal
    var shshowScrollIndicators: Bool = false
    var cellSpacing: CGFloat = 20
    var cellHeight: CGFloat = 280
    var cellWidth: CGFloat = 155
    
    init(movies: MovieBigModel) {
        self.movies = movies
    }
    
    var body: some View {
        ScrollView(scrollViewAxis, showsIndicators: shshowScrollIndicators) {
            HStack(spacing: cellSpacing) {
                ForEach(movies.docs ?? [], id: \.id) { movie in
                    MovieVericalCellMainView(movieByCategory: movie)
                        .frame(width: cellWidth, height: cellHeight)
                }
            }
        }
    }
}

#Preview {
    MovieByCategoryCollectionView(movies: MovieBigModel.init())
}
