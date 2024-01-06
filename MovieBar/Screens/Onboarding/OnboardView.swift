//
//  OnboardView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 5.01.24.
//

import SwiftUI

struct OnboardView: View {
    
    var board: OnboardingBoard
    var geometry: CGSize
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Image(board.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.width, height: geometry.height / 2)
                
                Text(board.title)
                    .font(.custom(.semiBold, size: 18))
                    .foregroundStyle(Color.custom.textWhite)
                    .lineLimit(4)
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                    .truncationMode(.tail)
                    .padding()
                
                Text(board.mainText)
                    .multilineTextAlignment(.center)
                    .font(.custom(.semiBold, size: 14))
                    .foregroundStyle(Color.custom.textGray)
                    .lineLimit(4)
                    .lineSpacing(5)
                    .multilineTextAlignment(.center)
                    .truncationMode(.tail)
                    .padding()
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    OnboardView(board: OnboardingBoard(image: "onboarding1", title: "Добро пожаловать в мир кино! Откройте для себя тысячи фильмов в одном приложении.", mainText: "Ваш проводник в мире кинематографа. Находите, сохраняйте и наслаждайтесь вашими любимыми фильмами."), geometry: CGSize(width: 300, height: 700))
}
