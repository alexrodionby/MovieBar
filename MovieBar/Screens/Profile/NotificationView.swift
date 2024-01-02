//
//  NotificationView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
        }
        .navigationTitle("Notification")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    NotificationView()
}
