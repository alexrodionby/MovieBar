//
//  PillTextField.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct PillTextField: View {
    
    @Binding var inputText: String
    var placeholder: LocalizedStringKey = LocalizedStringKey("Guest")
    var title: LocalizedStringKey = LocalizedStringKey("Full Name")
    var warning: LocalizedStringKey = LocalizedStringKey("Wrong!")
    var borderColor: Color = .custom.primarySoft
    var textFieldCornerRadius: CGFloat = 24
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            ZStack {
                TextField(placeholder, text: $inputText)
                    .font(.custom(.medium, size: 16))
                    .foregroundStyle(Color.custom.textWhite)
                    .padding()
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.webSearch)
                    .overlay(
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .foregroundStyle(Color.custom.textWhite)
                            .opacity(inputText.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                inputText = ""
                                hideKeyboard()
                            }
                        ,alignment: .trailing
                    )
                    .onSubmit {
                        
                    }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .overlay(
                RoundedRectangle(cornerRadius: textFieldCornerRadius)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(borderColor)
            )
            
            Text(title)
                .padding(4)
                .font(.custom(.medium, size: 12))
                .foregroundStyle(Color.custom.textWhite)
                .background {
                    Color.custom.primaryDark
                }
                .padding(EdgeInsets(top: -80, leading: 16, bottom: 0, trailing: 16))
        }
    }
}


#Preview {
    PillTextField(inputText: .constant("Maria Ivanovna"))
        .padding()
}
