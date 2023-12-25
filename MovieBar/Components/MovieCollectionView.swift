//
//  MovieCollectionView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 25.12.23.
//

import SwiftUI

struct MovieCollectionView: View {
    
    var collections: [Doc]
    var scrollViewAxis: Axis.Set = .horizontal
    var shshowScrollIndicators: Bool = false
    var cellSpacing: CGFloat = 20
    var cellHeight: CGFloat = 250
    var cellWidth: CGFloat = 250
    
    init(collections: [Doc]) {
        self.collections = collections
    }
    
    var body: some View {
        ScrollView(scrollViewAxis, showsIndicators: shshowScrollIndicators) {
            HStack(spacing: cellSpacing) {
                ForEach(collections, id: \.id) { collection in
                    MovieHorizontalMainCell(movieCollection: collection)
                        .frame(width: cellWidth, height: cellHeight)
                }
            }
        }
    }
}

#Preview {
    MovieCollectionView(collections: [Doc].init())
}
