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
    @StateObject private var wishListVM = WishlistViewModel()
    @StateObject private var profileVM = ProfileViewModel()
    @StateObject private var searchVM = SearchViewModel(apiClient: HTTPClient())
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $tabSelection) {
                HomeView(homeVM: homeVM, wishListVM: wishListVM)
                    .tag(1)
                SearchView(searchVM: searchVM)
                    .tag(2)
                ChristmasView()
                    .tag(3)
                ProfileView(profileVM: profileVM)
                    .tag(4)
            }
            .overlay(alignment: .bottom) {
                if tabbarManager.isTabbarVisible {
                    TabBottomView(geometry: geometry.size, tabSelection: $tabSelection)
                }
            }
            .onAppear {
                UIApplication.shared.applicationIconBadgeNumber = 0
                NotificationManager.shared.removeNotification()
            }
        }
    }
}

#Preview {
    TabbarView()
        .preferredColorScheme(.dark)
}
