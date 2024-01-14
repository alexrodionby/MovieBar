//
//  ProfileView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var profileVM: ProfileViewModel
    @EnvironmentObject var languageManager: LanguageManager
    @State var screenTitle: String = String(describing: LocalizedStringKey("Profile"))
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.custom.primaryDark
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    NavigationLink {
                        EditProfileView(user: profileVM.currentUser, profileVM: profileVM)
                    } label: {
                        ProfileNameLineView(profile: profileVM.currentUser)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(LocalizedStringKey("General"))
                            .font(.custom(.semiBold, size: 18))
                            .foregroundStyle(Color.custom.textWhite)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .truncationMode(.tail)
                            .padding()
                        
                        Divider()
                            .padding(.horizontal)
                        
                        NavigationLink {
                            NotificationView()
                        } label: {
                            ProfileMenuLineView()
                                .padding()
                        }

                        Divider()
                            .padding(.horizontal)
                        
                        NavigationLink {
                            LanguageView()
                        } label: {
                            ProfileMenuLineView(leftImage: Image(.globe), lineText: LocalizedStringKey("Language"))
                                .padding()
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.custom.primarySoft)
                    )
                    
                    VStack(alignment: .leading) {
                        Text(LocalizedStringKey("More"))
                            .font(.custom(.semiBold, size: 18))
                            .foregroundStyle(Color.custom.textWhite)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .truncationMode(.tail)
                            .padding()
                        Divider()
                            .padding(.horizontal)
                        NavigationLink {
                            PoliciesView()
                        } label: {
                            ProfileMenuLineView(leftImage: Image(.shield), lineText: LocalizedStringKey("Legal and Policies"))
                                .padding()
                        }

                        Divider()
                            .padding(.horizontal)
                        
                        NavigationLink {
                           AboutUsView()
                        } label: {
                            ProfileMenuLineView(leftImage: Image(.alert), lineText: LocalizedStringKey("About Us"))
                                .padding()
                        }

                  
                        
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.custom.primarySoft)
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .onAppear {
                if languageManager.currentLanguage == "ru" {
                    screenTitle = "Профиль"
                } else {
                    screenTitle = "Profile"
                }
            }
            .navigationTitle(screenTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView(profileVM: ProfileViewModel())
}
