//
//  TabbarView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 18.12.23.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $tabSelection) {
                HomeView(homeVM: HomeViewModel())
                    .tag(1)
                SearchView()
                    .tag(2)
                ChristmasView()
                    .tag(3)
                ProfileView()
                    .tag(4)
            }
            .overlay(alignment: .bottom) {
                TabBottomView(geometry: geometry.size, tabSelection: $tabSelection)
            }
        }
    }
}

#Preview {
    TabbarView()
        .preferredColorScheme(.dark)
}
