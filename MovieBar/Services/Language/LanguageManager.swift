//
//  LanguageManager.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 23.12.23.
//

import Foundation

class LanguageManager: ObservableObject {
    @Published var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "selectedLanguage")
            updateCategoryArray()
        }
    }
    
    init() {
        self.currentLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"
        updateCategoryArray()
    }
    
    private func updateCategoryArray() {
        if currentLanguage == "ru" {
            QueryParameters.category = QueryParameters.categoryRU
        } else {
            QueryParameters.category = QueryParameters.categoryEN
        }
    }
}
