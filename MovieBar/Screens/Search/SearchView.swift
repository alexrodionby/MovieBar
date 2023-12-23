//
//  SearchView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.custom.primaryDark
                    .ignoresSafeArea()
                Text("SearchView")
            }
        }
    }
}

#Preview {
    SearchView()
}
