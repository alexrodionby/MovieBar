//
//  TabBottomView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct TabBottomView: View {
    
    var geometry: CGSize
    @Binding var tabSelection: Int
    
    let tabBarItems: [(image: String, title: LocalizedStringKey)] = [
        ("home", LocalizedStringKey("Home")),
        ("search", LocalizedStringKey("Search")),
        ("film", LocalizedStringKey("Film")),
        ("person", LocalizedStringKey("Profile"))
    ]
    
    var body: some View {
        HStack(spacing: 40) {
            ForEach(0..<4) { item in
                Button {
                    withAnimation(.easeInOut) {
                        tabSelection = item + 1
                    }
                } label: {
                    HStack(spacing: 5) {
                        Image(tabBarItems[item].image)
                            .resizable()
                            .frame(width: geometry.height / 30, height: geometry.height / 30)
                        if item + 1 == tabSelection {
                            Text(tabBarItems[item].title)
                                .font(Font.custom(.medium, size: 12))
                        }
                    }
                    .foregroundColor(item + 1 == tabSelection ? Color.custom.primaryBlue : Color.gray)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(item + 1 == tabSelection ? Color.custom.primarySoft : Color.custom.primaryDark)
                .clipShape(Capsule())
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: geometry.height / 16)
        .padding(.bottom, 10)
    }
}

#Preview {
    TabbarView()
        .preferredColorScheme(.dark)
}
