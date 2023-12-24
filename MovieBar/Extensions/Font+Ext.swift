//
//  Font+Ext.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 23.12.23.
//

import Foundation
import SwiftUI

// Добавляем кастомные шрифты для удобного использования

enum CustomFont: String {
    case black = "Montserrat-Black"
    case bold = "Montserrat-Bold"
    case extraBold = "Montserrat-ExtraBold"
    case extraLight = "Montserrat-ExtraLight"
    case light = "Montserrat-Light"
    case medium = "Montserrat-Medium"
    case regular = "Montserrat-Regular"
    case semiBold = "Montserrat-SemiBold"
    case thin = "Montserrat-Thin"
}

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
