//
//  HomeView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeVM: HomeViewModel
    var profileName: String = "Guest"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.custom.primaryDark
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    AvatarLineView(profileName: profileName)
                    SearchBarView() { searchText in
                        print("Текст в родителе", searchText)
                    }
                    Button("GET") {
                        homeVM.getMovieCollections(parameters: QueryParameters.getMovieCollections)
                    }
                    
                    MovieCollectionView(collections: homeVM.movieCollections?.docs ?? [])
                    
                    CategoryLineView()
                    
                    CategoryMenuView(selectedIndex: $homeVM.selectedCategoryIndex)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

#Preview {
    HomeView(homeVM: HomeViewModel(apiClient: HTTPClient()))
}
