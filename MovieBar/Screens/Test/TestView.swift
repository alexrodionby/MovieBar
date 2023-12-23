//
//  TestView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var languageManager: LanguageManager
    @ObservedObject var testViewModel: TestViewModel
    
    let parameters: [String: Any] = [
        "page": "1",
        "limit": "20",
        "selectFields": ["name", "moviesCount", "cover"],
        "notNullFields": ["name", "moviesCount", "cover.previewUrl"],
        "sortField": "name",
        "sortType": "1",
        "category": "Фильмы"
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                Section(header: Text("Language")) {
                    Picker("Language", selection: $languageManager.currentLanguage) {
                        Text("Russian").tag("ru")
                        Text("English").tag("en")
                    }
                    .pickerStyle(.menu)
                }
                Button("Fetch") {
                    testViewModel.getMovieListCollection(parameters: parameters)
                }
                ForEach(testViewModel.movieList?.docs ?? [], id: \.id) { movie in
                    VStack {
                        Text(movie.name ?? "no name")
                        Text(String(movie.moviesCount ?? 0))
                        Divider()
                    }
                }
            }
        }
    }
}

#Preview {
    TestView(testViewModel: TestViewModel(apiClient: HTTPClient()))
        .environmentObject(LanguageManager())
}
