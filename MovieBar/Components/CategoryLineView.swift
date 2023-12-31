//
//  CategoryLineView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 25.12.23.
//

import SwiftUI

struct CategoryLineView<Content: View>: View {
    
    var leftText: String = "Category"
    var rightText: String = "See All"
    var leftColor: Color = .custom.textWhite
    var rightColor: Color = .custom.primaryBlueAccent
    var seeAllAction: (() -> Content)?
    
    var body: some View {
        HStack {
            Text(leftText)
                .font(.custom(.semiBold, size: 16))
                .foregroundStyle(leftColor)
            
            Spacer()
            
            NavigationLink {
                seeAllAction?()
            } label: {
                Text(rightText)
                    .font(.custom(.semiBold, size: 14))
                    .foregroundStyle(rightColor)
            }
        }
    }
}

#Preview {
    CategoryLineView<EmptyView>()
        .frame(width: 300, height: 50)
        .previewLayout(.sizeThatFits)
}
