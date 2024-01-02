//
//  AboutUsView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct AboutUsView: View {
    
    let aboutUs = """
        Привет! Я - разработчик MovieBar, твоего надежного гида в мире кино и сериалов. Страсть к программированию и любовь к кино вдохновляют меня создавать приложение, которое помогает тебе находить лучшие фильмы и сериалы. Моя цель - сделать твой опыт просмотра незабываемым. Если у тебя есть вопросы или предложения, не стесняйся связаться со мной. Приятного просмотра!
    """
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack {
                Text(aboutUs)
                    .font(.custom(.semiBold, size: 18))
                    .foregroundStyle(Color.custom.textWhite)
                    .lineSpacing(10)
                    .padding()
                
                Spacer()
            }
        }
        .navigationTitle("About Us")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    AboutUsView()
}
