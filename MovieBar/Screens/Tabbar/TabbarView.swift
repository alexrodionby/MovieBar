//
//  TabbarView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 18.12.23.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var tabSelection = 1
    @EnvironmentObject var tabbarManager: TabbarManager
    @StateObject private var homeVM = HomeViewModel(apiClient: HTTPClient())
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $tabSelection) {
                HomeView(homeVM: homeVM)
                    .tag(1)
                SearchView()
                    .tag(2)
                ChristmasView()
                    .tag(3)
                ProfileView()
                    .tag(4)
            }
            .overlay(alignment: .bottom) {
                if tabbarManager.isTabbarVisible {
                    TabBottomView(geometry: geometry.size, tabSelection: $tabSelection)
                }
            }
        }
    }
}

#Preview {
    TabbarView()
        .preferredColorScheme(.dark)
}
