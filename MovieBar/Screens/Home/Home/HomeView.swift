//
//  HomeView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var wishListVM: WishlistViewModel
    @State var userProfile: UserProfileModel?
    @State private var isSearchResultsVisible = false
    @State private var goToMoviesByCategory = false
    @State private var isInitialLoad = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.custom.primaryDark
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    AvatarLineView(userProfile: userProfile, wishListVM: wishListVM)
                    
                    SearchBarView() { searchText in
                        homeVM.searchMovieByName(name: searchText)
                        isSearchResultsVisible = true
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        MovieCollectionView(collections: homeVM.movieCollections?.docs ?? []) { slug in
                            homeVM.searchMovieByCollection(slug: slug)
                            goToMoviesByCategory = true
                        }
                        
                        CategoryLineView() {
                            MovieListView(movies: homeVM.moviesByCategory?.docs, screenTitle: "Categories")
                        }
                        
                        CategoryMenuView(selectedIndex: $homeVM.selectedCategoryIndex) { index in
                            homeVM.getMovieByOneCategory(index: index, parameters: QueryParameters.getMovieByCategory)
                        }
                        
                        MovieByCategoryCollectionView(movies: homeVM.moviesByCategory ?? MovieBigModel())
                        
                        CategoryLineView(leftText: "Most popular") {
                            MovieListView(movies: homeVM.mostPopularMovies?.docs, screenTitle: "Most popular")
                        }
                        
                        MovieByCategoryCollectionView(movies: homeVM.mostPopularMovies ?? MovieBigModel())
                    }
                    .refreshable {
                        print("Потянули чтобы обновить")
                        homeVM.getMovieCollections(parameters: QueryParameters.getMovieCollections)
                        homeVM.getMovieByCategory(parameters: QueryParameters.getMovieByCategory)
                        homeVM.getPopularMovies(parameters: QueryParameters.getPopularMovie)
                    }
                    
                    if isSearchResultsVisible {
                        NavigationLink(
                            destination: MovieListView(movies: homeVM.searchMovieResult?.docs, screenTitle: "Search Result", scrollViewAxis: .vertical, shshowScrollIndicators: false),
                            isActive: $isSearchResultsVisible
                        ) {
                            EmptyView()
                        }
                    }
                    
                    if goToMoviesByCategory {
                        NavigationLink(
                            destination: MovieListView(movies: homeVM.moviesByCollection?.docs, screenTitle: "Collection Movies", scrollViewAxis: .vertical, shshowScrollIndicators: false),
                            isActive: $goToMoviesByCategory
                        ) {
                            EmptyView()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .onTapGesture {
                hideKeyboard()
            }
            .onAppear {
                userProfile = StorageService.shared.loadUserProfile(username: "currentUsername")
                if !isInitialLoad {
                    homeVM.getMovieCollections(parameters: QueryParameters.getMovieCollections)
                    homeVM.getMovieByCategory(parameters: QueryParameters.getMovieByCategory)
                    homeVM.getPopularMovies(parameters: QueryParameters.getPopularMovie)
                    isInitialLoad = true
                }
            }
        }
    }
}

//#Preview {
//    HomeView(homeVM: HomeViewModel(apiClient: HTTPClient()), wishListVM: WishlistViewModel())
//}
