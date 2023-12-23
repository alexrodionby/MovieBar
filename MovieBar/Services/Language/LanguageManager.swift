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
        }
    }
    
    init() {
        self.currentLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "ru"
    }
}
