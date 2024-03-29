//
//  LanguageView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct LanguageView: View {
    
    @EnvironmentObject var languageManager: LanguageManager
    @State var screenTitle: String?
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey("Language"))
                        .font(.custom(.semiBold, size: 18))
                        .foregroundStyle(Color.custom.textWhite)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                        .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    
                    Button {
                        print("выбрали английский")
                        languageManager.currentLanguage = "en"
                        screenTitle = "Language"
                    } label: {
                        ProfileMenuLineView(
                            leftImage: Image(.flag),
                            lineText: "English",
                            rightImage: Image(.heart),
                            rightImageColor: languageManager.currentLanguage == "en" ? .custom.primaryBlueAccent : .custom.primarySoft,
                            rotation: false
                        )
                        .padding()
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    Button {
                        print("выбрали русский")
                        languageManager.currentLanguage = "ru"
                        screenTitle = "Язык"
                    } label: {
                        ProfileMenuLineView(
                            leftImage: Image(.flag),
                            lineText: "Русский",
                            rightImage: Image(.heart),
                            rightImageColor: languageManager.currentLanguage == "ru" ? .custom.primaryBlueAccent : .custom.primarySoft,
                            rotation: false
                        )
                        .padding()
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(Color.custom.primarySoft)
                )
                .padding()
                
                Spacer()
            }
        }
        .onAppear {
            if languageManager.currentLanguage == "ru" {
                screenTitle = "Язык"
            } else {
                screenTitle = "Language"
            }
        }
        .navigationTitle(screenTitle ?? "Language")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    LanguageView()
}
