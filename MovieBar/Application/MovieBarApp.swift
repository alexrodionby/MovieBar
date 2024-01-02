//
//  MovieBarApp.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 18.12.23.
//

import SwiftUI

@main
struct MovieBarApp: App {
    
    @StateObject private var languageManager = LanguageManager()
    @StateObject private var tabbarManager = TabbarManager()
    
    var body: some Scene {
        WindowGroup {
            TabbarView()
                .preferredColorScheme(.dark)
                .environmentObject(languageManager)
                .environmentObject(tabbarManager)
                .environment(\.locale, .init(identifier: languageManager.currentLanguage))
        }
    }
}
