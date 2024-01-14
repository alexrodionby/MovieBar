//
//  ProfileNameLineView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI
import Kingfisher

struct ProfileNameLineView: View {
    
    var profile: UserProfileModel?
    var editIconSize: CGFloat = 30
    
    var body: some View {
        
        HStack {
            if profile?.avatar != nil {
                AvatarCircleView(personImage: Image(profile?.avatar ?? "person"))
                    .padding(.horizontal, 8)
            } else {
                AvatarCircleView()
                    .padding(.horizontal, 8)
            }
            
            VStack {
                if profile?.name != nil {
                    Text(profile!.name)
                        .font(.custom(.semiBold, size: 16))
                        .foregroundStyle(Color.custom.textWhite)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                } else {
                    Text(LocalizedStringKey("Guest"))
                        .font(.custom(.semiBold, size: 16))
                        .foregroundStyle(Color.custom.textWhite)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                }

                if profile?.email != nil {
                    Text(profile!.email)
                        .font(.custom(.semiBold, size: 14))
                        .foregroundStyle(Color.custom.textGray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                } else {
                    Text(LocalizedStringKey("No email"))
                        .font(.custom(.semiBold, size: 14))
                        .foregroundStyle(Color.custom.textGray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                }
            }
            
            Spacer()
            
            Image(.edit)
                .resizable()
                .frame(width: editIconSize, height: editIconSize)
                .foregroundColor(.custom.primaryBlueAccent)
                .padding(.horizontal, 8)
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color.custom.primarySoft)
        )
        
        
    }
}

#Preview {
    ProfileNameLineView()
}
