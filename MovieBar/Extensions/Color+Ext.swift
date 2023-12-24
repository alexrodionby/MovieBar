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
    let primaryBlueAccent = Color("primaryBlueAccent")
    let primaryDark = Color("primaryDark")
    let primarySoft = Color("primarySoft")
    let secondaryGreen = Color("secondaryGreen")
    let secondaryOrange = Color("secondaryOrange")
    let secondaryRed = Color("secondaryRed")
    let textBlack = Color("textBlack")
    let textDarkGray = Color("textDarkGray")
    let textGray = Color("textGray")
    let textLineDark = Color("textLineDark")
    let textWhite = Color("textWhite")
    let textWhiteGray = Color("textWhiteGray")
}
