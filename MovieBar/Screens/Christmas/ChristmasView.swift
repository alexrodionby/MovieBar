//
//  ChristmasView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct ChristmasView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.custom.primaryDark
                    .ignoresSafeArea()
                Text("ChristmasView")
            }
        }
    }
}

#Preview {
    ChristmasView()
}
