//
//  EditProfileView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct EditProfileView: View {
    
    var user: UserProfileModel?
    @ObservedObject var profileVM: ProfileViewModel
    @State var inputName: String = ""
    @State var inputEmail: String = ""
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                
                VStack(spacing: 16) {
                    AvatarCircleView(avatarFrameSize: 100, imageFrameSize: 100)
                    if user?.name != nil {
                        Text(user!.name)
                            .font(.custom(.semiBold, size: 16))
                            .foregroundStyle(Color.custom.textWhite)
                    } else {
                        Text(LocalizedStringKey("Guest"))
                            .font(.custom(.semiBold, size: 16))
                            .foregroundStyle(Color.custom.textWhite)
                    }
                    
                    if user?.email != nil {
                        Text(user!.email)
                            .font(.custom(.semiBold, size: 14))
                            .foregroundStyle(Color.custom.textGray)
                    } else {
                        Text(LocalizedStringKey("No email"))
                            .font(.custom(.semiBold, size: 14))
                            .foregroundStyle(Color.custom.textGray)
                    }
                }
                .padding(.bottom, 32)
                if user?.name != nil {
                    PillTextField(inputText: $inputName, placeholder: LocalizedStringKey(user!.name))
                } else {
                    PillTextField(inputText: $inputName)
                }
                
                if user?.email != nil {
                    PillTextField(inputText: $inputName, placeholder: LocalizedStringKey(user!.email))
                } else {
                    PillTextField(inputText: $inputEmail, placeholder: LocalizedStringKey("No Email"), title: LocalizedStringKey("Email"))
                }
                
                Spacer()
                
                Button(action: {
                    print("Сохраняем изменения профиля")
                    profileVM.saveUser(user: UserProfileModel(name: inputName, email: inputEmail))
                }, label: {
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color.custom.primaryBlueAccent)
                        .frame(width: 250, height: 50)
                        .overlay(
                            Text("Save Changes")
                                .font(.custom(.semiBold, size: 16))
                                .foregroundStyle(Color.custom.textWhite)
                        )
                })
                .padding(.bottom)
                
                
            }
            .padding()
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationTitle("Edit Profile")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    EditProfileView(profileVM: ProfileViewModel())
}
