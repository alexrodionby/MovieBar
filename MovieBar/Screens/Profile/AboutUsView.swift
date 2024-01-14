//
//  AboutUsView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct AboutUsView: View {
    
    @EnvironmentObject var languageManager: LanguageManager
    
    let aboutUsRU = """
        Привет! Я - разработчик MovieBar, твоего надежного гида в мире кино и сериалов. Страсть к программированию и любовь к кино вдохновляют меня создавать приложение, которое помогает тебе находить лучшие фильмы и сериалы. Моя цель - сделать твой опыт просмотра незабываемым. Если у тебя есть вопросы или предложения, не стесняйся связаться со мной. Приятного просмотра!
    """
    let aboutUsEN = """
        Hello! I am the developer of MovieBar, your reliable guide in the world of movies and TV shows. Passion for programming and love for cinema inspire me to create an application that helps you discover the best films and series. My goal is to make your viewing experience unforgettable. If you have any questions or suggestions, feel free to contact me. Enjoy your viewing!
    """
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack {
                if languageManager.currentLanguage == "ru" {
                    Text(aboutUsRU)
                        .font(.custom(.semiBold, size: 18))
                        .foregroundStyle(Color.custom.textWhite)
                        .lineSpacing(10)
                        .padding()
                } else {
                    Text(aboutUsEN)
                        .font(.custom(.semiBold, size: 18))
                        .foregroundStyle(Color.custom.textWhite)
                        .lineSpacing(10)
                        .padding()
                }
                
                
                Spacer()
            }
        }
        .navigationTitle(LocalizedStringKey("About Us"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    AboutUsView()
}
