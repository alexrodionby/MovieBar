//
//  HomeViewModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 24.12.23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    private let apiClient: HTTPClient
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(apiClient: HTTPClient) {
        self.apiClient = apiClient
    }
    
    @Published var movieCollections: MovieCollectionModel?
    @Published var moviesByCategory: MovieBigModel?
    @Published var mostPopularMovies: MovieBigModel?
    @Published var searchMovieResult: MovieBigModel?
    @Published var moviesByCollection: MovieBigModel?
    
    //@Published var searchText: String = ""
    @Published var selectedCategoryIndex = 0
    
    
    // MARK: - public methods
    
    func getMovieCollections(parameters: [String: Any]?) {
        apiClient.request(endpoint: MovieEndpoint.fetchMovieCollections(parameters))
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("getMovieCollections = OK")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] (result: MovieCollectionModel) in
                self?.movieCollections = result
            }
            .store(in: &cancellables)
        
    }
    
    func getMovieByCategory(parameters: [String: Any]?) {
        apiClient.request(endpoint: MovieEndpoint.fetchMovieByCategory(parameters))
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("getMovieByCategory = OK")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] (result: MovieBigModel) in
                self?.moviesByCategory = result
            }
            .store(in: &cancellables)
    }
    
    func getMovieByOneCategory(index: Int, parameters: [String: Any]?) {
        if index == 0 {
            getMovieByCategory(parameters: parameters)
        } else {
            var query = parameters
            query?["genres.name"] = QueryParameters.categoryForQuery[index - 1]
            getMovieByCategory(parameters: query)
        }
    }
    
    func getPopularMovies(parameters: [String: Any]?) {
        apiClient.request(endpoint: MovieEndpoint.fetchMovieByCategory(parameters))
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("getPopularMovies = OK")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] (result: MovieBigModel) in
                self?.mostPopularMovies = result
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
    
    func searchMovieByCollection(slug: String) {
        var query = QueryParameters.getMovieByCollection
        query["lists"] = slug
        apiClient.request(endpoint: MovieEndpoint.fetchMovieByCollection(query))
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("searchMovieByName = OK")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] (result: MovieBigModel) in
                self?.moviesByCollection = result
            }
            .store(in: &cancellables)
    }
    
}
