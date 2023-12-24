//
//  TabBottomView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct TabBottomView: View {
    
    private struct Drawing {
        static let buttonImageRatio: Double = 30
        static let tabbarSpacing: CGFloat = 40
        static let tabbarFontSize: CGFloat = 12
        static let tabbarButtonSpacing: CGFloat = 5
        static let tabbarBottomPading: CGFloat = 10
        static let tabbarHightRatio: Double = 16
        static let buttonVerticalPadding: CGFloat = 5
        static let buttonHorizontalPadding: CGFloat = 10
    }
    
    var geometry: CGSize
    @Binding var tabSelection: Int
    
    let tabBarItems: [(image: String, title: LocalizedStringKey)] = [
        ("home", LocalizedStringKey("Home")),
        ("search", LocalizedStringKey("Search")),
        ("film", LocalizedStringKey("Film")),
        ("person", LocalizedStringKey("Profile"))
    ]
    
    var body: some View {
        HStack(spacing: Drawing.tabbarSpacing) {
            ForEach(0..<4) { item in
                Button {
                    withAnimation(.easeInOut) {
                        tabSelection = item + 1
                    }
                } label: {
                    HStack(spacing: Drawing.tabbarButtonSpacing) {
                        Image(tabBarItems[item].image)
                            .resizable()
                            .frame(width: geometry.height / Drawing.buttonImageRatio, height: geometry.height / Drawing.buttonImageRatio)
                        if item + 1 == tabSelection {
                            Text(tabBarItems[item].title)
                                .font(Font.custom(.medium, size: Drawing.tabbarFontSize))
                        }
                    }
                    .foregroundColor(item + 1 == tabSelection ? Color.custom.primaryBlueAccent : Color.custom.textGray)
                }
                .padding(.vertical, Drawing.buttonVerticalPadding)
                .padding(.horizontal, Drawing.buttonHorizontalPadding)
                .background(item + 1 == tabSelection ? Color.custom.primarySoft : Color.custom.primaryDark)
                .clipShape(Capsule())
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: geometry.height / Drawing.tabbarHightRatio)
        .padding(.bottom, Drawing.tabbarBottomPading)
    }
}

#Preview {
    TabbarView()
        .preferredColorScheme(.dark)
}
