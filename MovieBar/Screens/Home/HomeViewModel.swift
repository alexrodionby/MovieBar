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
    
    @Published var searchText: String = ""
    @Published var movieCollections: MovieCollectionModel?
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
    
}
