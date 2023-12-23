//
//  Color+Ext.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//

import Foundation
import SwiftUI

// Добавляем кастомные цвета к стандартным

extension Color {
    static let custom = CustomColors()
}

struct CustomColors {
    let primaryDark = Color("primaryDark")
    let primarySoft = Color("primarySoft")
    let primaryBlue = Color("primaryBlue")
    let secondaryOrange = Color("secondaryOrange")
}
