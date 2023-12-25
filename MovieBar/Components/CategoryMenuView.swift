//
//  CategoryMenuView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 25.12.23.
//

import SwiftUI

struct CategoryMenuView: View {
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(0..<QueryParameters.category.count) { category in
                    CategoryElementView(categoryIndex: category, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

#Preview {
    CategoryMenuView(selectedIndex: Binding<Int>.constant(3))
}
