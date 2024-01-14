//
//  OnboardingMainView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 5.01.24.
//

import SwiftUI

struct OnboardingMainView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var homeVM: HomeViewModel
    @State private var currentPage: Int = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            TabView(selection: $currentPage) {
                ForEach(intros.indices, id: \.self) { index in
                    OnboardView(board: intros[index], geometry: geometry.size)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            .overlay(
                PageControl(numberOfPages: intros.count, currentPage: $currentPage)
                    .offset(x: 50, y: -50)
                    .animation(.easeInOut(duration: 0.5), value: currentPage)
                , alignment: .bottomLeading
            )
            .overlay (
                Button(action: {
                    withAnimation {
                        if currentPage == intros.count - 1 {
                            print("currentPage=", currentPage)
                            print("intros.count=", intros.count)
                            print("Переходим на главный экран")
                            hasSeenOnboarding.toggle()
                            print("hasSeenOnboarding=", hasSeenOnboarding)
                            presentationMode.wrappedValue.dismiss()
                            homeVM.getMovieCollections(parameters: QueryParameters.getMovieCollections)
                            homeVM.getMovieByCategory(parameters: QueryParameters.getMovieByCategory)
                            homeVM.getPopularMovies(parameters: QueryParameters.getPopularMovie)
                        } else {
                            currentPage = min(currentPage + 1, intros.count - 1)
                            print("currentPage=", currentPage)
                            print("intros.count=", intros.count)
                        }
                    }
                }) {
                    Image(.arrowback)
                        .resizable()
                        .rotationEffect(.degrees(180))
                        .frame(width: 30, height: 30)
                        .foregroundColor(.custom.primarySoft)
                        .padding()
                        .background(Color.custom.primaryBlueAccent)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .trim(from: 0, to: CGFloat(currentPage + 1) / CGFloat(intros.count))
                                .stroke(Color.custom.primaryBlueAccent, lineWidth: 2)
                                .rotationEffect(.degrees(-90))
                                .padding(-6)
                                .animation(.easeInOut(duration: 0.5), value: currentPage)
                        )
                }
                    .offset(x: -30, y: -10)
                    .padding()
                ,alignment: .bottomTrailing
            )
        }
    }
    
    struct PageControl: View {
        var numberOfPages: Int
        @Binding var currentPage: Int
        
        var body: some View {
            HStack(spacing: 5) {
                ForEach(0..<numberOfPages) { page in
                    Capsule()
                        .frame(width: page == currentPage ? 30 : 10, height: 10)
                        .foregroundColor(page == currentPage ? .custom.primaryBlueAccent : .custom.primaryBlueAccent.opacity(0.5))
                        .padding(4)
                        .onTapGesture {
                            currentPage = page
                        }
                }
            }
        }
    }
}

#Preview {
    OnboardingMainView(homeVM: HomeViewModel(apiClient: HTTPClient()))
}
