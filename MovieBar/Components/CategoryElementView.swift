//
//  CategoryElementView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 25.12.23.
//

import SwiftUI

struct CategoryElementView: View {
    
    var categoryIndex: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack {
            Text(QueryParameters.category[categoryIndex])
                .font(.custom(.medium, size: 12))
                .foregroundStyle(selectedIndex == categoryIndex ? Color.custom.primaryBlueAccent : Color.custom.textWhiteGray)
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(Color.custom.primarySoft)
                        .opacity(selectedIndex == categoryIndex ? 1 : 0)
                }
        }
        .onTapGesture {
            withAnimation {
                selectedIndex = categoryIndex
            }
            // вызов сетевого запроса
            print("Делаем сетевой запрос")
        }
    }
}

#Preview {
    CategoryElementView(categoryIndex: 5, selectedIndex: .constant(5))
}
