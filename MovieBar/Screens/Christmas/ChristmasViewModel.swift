//
//  ChristmasViewModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 13.01.24.
//

import Foundation
import Combine

class ChristmasViewModel: ObservableObject {
    
    private let apiClient: HTTPClient
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(apiClient: HTTPClient) {
        self.apiClient = apiClient
    }
    
    var selectedMovies: [String] = []
    var moviesArray: [String] = QueryParameters.newYearMovies
    @Published var searchMovieResult: MovieBigModel?

    func getRandomMovie() -> String? {
        guard !moviesArray.isEmpty else {
            return nil
        }

        let randomIndex = Int.random(in: 0..<moviesArray.count)
        let selectedMovie = moviesArray[randomIndex]
        selectedMovies.append(selectedMovie)
        moviesArray.remove(at: randomIndex)

        return selectedMovie
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
