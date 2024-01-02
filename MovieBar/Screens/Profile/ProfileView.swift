//
//  ProfileView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 21.12.23.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var profileVM: ProfileViewModel
    
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
                        Text("General")
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
                            ProfileMenuLineView(leftImage: Image(.globe), lineText: "Language")
                                .padding()
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.custom.primarySoft)
                    )
                    
                    VStack(alignment: .leading) {
                        Text("More")
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
                            ProfileMenuLineView(leftImage: Image(.shield), lineText: "Legal and Policies")
                                .padding()
                        }

                        Divider()
                            .padding(.horizontal)
                        
                        NavigationLink {
                           AboutUsView()
                        } label: {
                            ProfileMenuLineView(leftImage: Image(.alert), lineText: "About Us")
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
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView(profileVM: ProfileViewModel())
}
