//
//  MovieHorizontalMainCell.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 25.12.23.
//

import SwiftUI
import Kingfisher

struct MovieHorizontalMainCell: View {
    
    var movieCollection: Doc
    
    init(movieCollection: Doc) {
        self.movieCollection = movieCollection
    }
    
    var cellWidth: CGFloat = 250
    var cellHeight: CGFloat = 250
    var cellCornerRadius: CGFloat = 16
    var titleLineLimit: Int = 5
    var textPadding: CGFloat = 8
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            KFImage(URL(string: movieCollection.cover?.url ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: cellWidth, height: cellHeight)
                .clipShape(RoundedRectangle(cornerRadius: cellCornerRadius))
            
            VStack {
                Text(movieCollection.name ?? "No collection Name")
                    .font(.custom(.semiBold, size: 16))
                    .foregroundStyle(Color.custom.textWhite)
                    .lineLimit(titleLineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .padding(textPadding)
                
                HStack(spacing: 5) {
                    Text(movieCollection.moviesCount?.description ?? "00")
                    Text("movies")
                }
                .font(.custom(.medium, size: 12))
                .foregroundStyle(Color.custom.textWhiteGray)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .truncationMode(.tail)
                .padding(.bottom, textPadding)
                .padding(.leading, textPadding)
            }
            .background(
                RoundedRectangle(cornerRadius: cellCornerRadius)
                    .fill(Color.black.opacity(0.3))
            )
            .padding(8)
        }
    }
}

#Preview {
    MovieHorizontalMainCell(movieCollection: Doc())
}
