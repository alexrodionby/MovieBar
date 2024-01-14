//
//  SearchView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var searchVM: SearchViewModel
    @State private var isInitialLoad = false
    @State private var isSearchResultsVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.custom.primaryDark
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    SearchBarView() { searchText in
                        searchVM.searchMovieByName(name: searchText)
                        isSearchResultsVisible = true
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        CategoryLineView(leftText: "Filming movies") {
                            MovieListView(movies: searchVM.filmingMovies?.docs)
                        }
                        
                        MovieByCategoryCollectionView(movies: searchVM.filmingMovies ?? MovieBigModel())
                        
                        CategoryLineView(leftText: "Recent movies") {
                            MovieListView(movies: searchVM.recentList)
                        }
                        
                        MovieByCategoryCollectionView(movies: MovieBigModel(docs: searchVM.recentList))
                            .onAppear {
                                searchVM.updateRecentList()
                            }
                        
                        Spacer()
                    }
                    
                    if isSearchResultsVisible {
                        NavigationLink(
                            destination: MovieListView(movies: searchVM.searchMovieResult?.docs, screenTitle: "Search Result", scrollViewAxis: .vertical, shshowScrollIndicators: false),
                            isActive: $isSearchResultsVisible
                        ) {
                            EmptyView()
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                if !isInitialLoad {
                    searchVM.getFilmingMovies()
                    isInitialLoad = true
                }
            }
        }
    }
}

#Preview {
    SearchView(searchVM: SearchViewModel(apiClient: HTTPClient()))
}
