//
//  SearchBarView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 24.12.23.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    
    @State var searchText: String = ""
    let defaultSearchText = LocalizedStringKey("Search a title...")
    var searchTextSize: CGFloat = 14
    var cornerRadius: CGFloat = 24
    var emptyFieldColor: Color = .custom.textGray
    var searchFieldColor: Color = .custom.textWhite
    var backgroundColor: Color = .custom.primarySoft
    var searchActionIcon: Image = Image(.globe)
    var searchActionHeight: CGFloat = 20
    var searchAction: ((String) -> Void)?
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? emptyFieldColor : searchFieldColor)
            
            TextField(defaultSearchText, text: $searchText)
                .foregroundStyle(searchFieldColor)
                .padding(.trailing, 25)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .keyboardType(.webSearch)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 15)
                        .foregroundStyle(searchFieldColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
                .onSubmit {
                    searchAction?(searchText)
                }
            
            Text("⏐")
                .foregroundStyle(searchText.isEmpty ? emptyFieldColor : searchFieldColor)
            
            Button(action: {
                searchAction?(searchText)
                hideKeyboard()
            }, label: {
                searchActionIcon
                    .resizable()
                    .scaledToFit()
                    .frame(height: searchActionHeight)
                    .foregroundStyle(searchText.isEmpty ? emptyFieldColor : searchFieldColor)
            })
            .disabled(searchText == "")
        }
        .font(.custom(.medium, size: searchTextSize))
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
        }
    }
}

#Preview {
    SearchBarView()
        .previewLayout(.sizeThatFits)
        .frame(width: 300, height: 50)
}
