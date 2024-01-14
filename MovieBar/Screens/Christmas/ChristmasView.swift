//
//  ChristmasView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct ChristmasView: View {
    @State private var isPopoverPresented = false
    @State private var popoverPosition: CGPoint = .zero
    @State private var blurRadius: CGFloat = 0
    @ObservedObject var christmasVM: ChristmasViewModel
    @State var movieLabel: String?
    @State private var isSearchResultsVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.custom.primaryDark
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image(.tree)
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                        .padding()
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded { gesture in
                                    movieLabel = christmasVM.getRandomMovie()
                                    let touchLocation = gesture.location
                                    popoverPosition = CGPoint(x: touchLocation.x, y: touchLocation.y)
                                    withAnimation(Animation.easeInOut(duration: 1)) {
                                        isPopoverPresented.toggle()
                                        print("isPopoverPresented", isPopoverPresented)
                                        blurRadius = isPopoverPresented ? 5 : 0
                                    }
                                }
                        )
                    Spacer()
                    if isSearchResultsVisible {
                        NavigationLink(
                            destination: MovieListView(movies: christmasVM.searchMovieResult?.docs, screenTitle: "Search Result", scrollViewAxis: .vertical, shshowScrollIndicators: false),
                            isActive: $isSearchResultsVisible
                        ) {
                            EmptyView()
                        }
                    }
                }
                .blur(radius: blurRadius)
                .overlay(
                    PopoverView(movieLabel: movieLabel ?? "", isPresented: $isPopoverPresented) {
                        withAnimation(Animation.easeInOut(duration: 1)) {
                            print("TapAction Сработал")
                            isPopoverPresented.toggle()
                            blurRadius = 0
                            christmasVM.searchMovieByName(name: movieLabel ?? "")
                            isSearchResultsVisible.toggle()
                            print("isPopoverPresented", isPopoverPresented)
                        }
                    }
                        .position(x: popoverPosition.x, y: popoverPosition.y)
                )
            }
        }
    }
}

struct PopoverView: View {
    
    var movieLabel: String
    @Binding var isPresented: Bool
    var tapAction: (() -> Void)?
    
    var body: some View {
        if isPresented {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.custom.textGray, lineWidth: 2)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.custom.primarySoft))
                .frame(width: 200, height: 150)
                .onTapGesture {
                    isPresented = false
                }
                .overlay {
                    VStack {
                        Spacer()
                        
                        Text(movieLabel)
                            .font(.custom(.semiBold, size: 16))
                            .foregroundStyle(Color.custom.textWhite)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .truncationMode(.tail)
                            .padding()
                        
                        Button(action: {
                            tapAction?()
                        }, label: {
                            RoundedRectangle(cornerRadius: 32, style: .continuous)
                                .fill(Color.custom.primaryBlueAccent)
                                .frame(width: 40 * 2.5, height: 40)
                                .overlay(
                                    HStack {
                                        Image(.film)
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("Go!")
                                            .font(.custom(.semiBold, size: 16))
                                    }
                                        .foregroundColor(.custom.textWhite)
                                )
                        })
                        
                        Spacer()
                    }
                }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    ChristmasView(christmasVM: ChristmasViewModel(apiClient: HTTPClient()))
}
