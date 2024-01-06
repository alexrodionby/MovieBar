//
//  OnboardingBoard.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 5.01.24.
//

import Foundation

struct OnboardingBoard: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var mainText: String
}

var intros: [OnboardingBoard] = [
    OnboardingBoard(image: "onboarding1", title: "Добро пожаловать в мир кино! Откройте для себя тысячи фильмов в одном приложении.", mainText: "Ваш проводник в мире кинематографа. Находите, сохраняйте и наслаждайтесь вашими любимыми фильмами."),
    OnboardingBoard(image: "onboarding2", title: "Легкий поиск. Мощная аналитика. Наше приложение поможет вам найти фильмы, которые подходят именно вам.", mainText: "Смотрите трейлеры, читайте рецензии, выбирайте лучшие фильмы. Мы сделали все для вашего комфорта."),
    OnboardingBoard(image: "onboarding3", title: "Создайте свой список желаемого. Никогда не упустите фильм, который хотели посмотреть.", mainText: "Помните о ваших любимых кинематографических переживаниях. Сохраняйте ваши впечатления с нами.")
]
