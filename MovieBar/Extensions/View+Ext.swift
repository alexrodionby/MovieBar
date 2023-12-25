//
//  View+Ext.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 24.12.23.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
