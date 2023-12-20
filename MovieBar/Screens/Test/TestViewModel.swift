//
//  TestViewModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//

import Foundation
import Combine

class TestViewModel: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    private let apiClient: HTTPClient
    
    @Published var movieList: MovieListModel?
    
    init(apiClient: HTTPClient) {
        self.apiClient = apiClient
    }
    
    func getMovieListCollection(parameters: [String: Any]?) {
        apiClient.request(endpoint: MovieEndpoint.fetchMovieListCollection(parameters))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Успешно получили данные во вью модель")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] (result: MovieListModel) in
                self?.movieList = result
                print("Received data: \(result)")
            })
            .store(in: &cancellables)
    }
}
