//
//  AgeRatingView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 28.12.23.
//

import SwiftUI

struct AgeRatingView: View {
    
    var age: Int = 13
    var labelText: String = "PG-"
    
    var body: some View {
        
        HStack(spacing: 0) {
            Text(labelText)
            Text(String(age))
        }
        .font(.custom(.semiBold, size: 12))
        .foregroundStyle(Color.custom.primaryBlueAccent)
        .lineLimit(1)
        .padding(4)
        .overlay(
            RoundedRectangle(cornerRadius: 3)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color.custom.primaryBlueAccent)
        )
    }
}

#Preview {
    AgeRatingView()
}
