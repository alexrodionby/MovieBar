//
//  SearchViewModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 2.01.24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    private let apiClient: HTTPClient
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(apiClient: HTTPClient) {
        self.apiClient = apiClient
        updateRecentList()
    }
    
    @Published var filmingMovies: MovieBigModel?
    @Published var recentList: [MovieDetail]?
    @Published var searchMovieResult: MovieBigModel?
    
    func saveToWishList(movie: MovieDetail) {
        StorageService.shared.saveToRecentList(movie: movie)
        self.recentList = StorageService.shared.loadRecent()
    }
    
    func updateRecentList() {
        self.recentList = StorageService.shared.loadRecent()
    }
    
    func getFilmingMovies() {
        var query = QueryParameters.getFilmingMovie
        query["status"] = "filming"
        apiClient.request(endpoint: MovieEndpoint.fetchMovieByCategory(query))
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("searchMovieByName = OK")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] (result: MovieBigModel) in
                self?.filmingMovies = result
            }
            .store(in: &cancellables)
    }
    
    func searchMovieByName(name: String) {
        var query = QueryParameters.searchMovieByName
        query["query"] = name
        apiClient.request(endpoint: MovieEndpoint.searchByMovieName(query))
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("searchMovieByName = OK")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] (result: MovieBigModel) in
                self?.searchMovieResult = result
            }
            .store(in: &cancellables)
    }
    
}
