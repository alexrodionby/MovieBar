//
//  Set+Cancellable.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//

import Foundation
import Combine

extension Set where Element: Cancellable {
    func cancel() {
        forEach { $0.cancel() }
    }
}
