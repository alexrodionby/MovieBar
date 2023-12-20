//
//  MovieBarApp.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 18.12.23.
//

import SwiftUI

@main
struct MovieBarApp: App {
    var body: some Scene {
        WindowGroup {
            TestView(testViewModel: TestViewModel(apiClient: HTTPClient()))
        }
    }
}
