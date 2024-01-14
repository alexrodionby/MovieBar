//
//  NotificationView.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 1.01.24.
//

import SwiftUI

struct NotificationView: View {
    
    @State private var isSwitchOn = false
    @State private var timeInterval: TimeInterval = 30
    
    var body: some View {
        ZStack {
            Color.custom.primaryDark
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    Text("Notification")
                        .font(.custom(.semiBold, size: 18))
                        .foregroundStyle(Color.custom.textWhite)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                        .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    
                    HStack(spacing: 0) {
                        Text("Show Notifications")
                            .font(.custom(.medium, size: 16))
                            .foregroundStyle(Color.custom.textWhite)
                            .lineLimit(2)
                            .padding()
                        
                        Toggle("", isOn: $isSwitchOn)
                            .padding()
                            .toggleStyle(SwitchToggleStyle(tint: .custom.primaryBlueAccent))
                            .onChange(of: isSwitchOn) { newValue in
                                if newValue {
                                    print("Switch is ON!")
                                    NotificationManager.shared.scheduleNotification(after: timeInterval)
                                } else {
                                    print("Switch is OFF!")
                                    NotificationManager.shared.cancelNotification()
                                }
                            }
                    }
                    
                    
                    Divider()
                        .padding(.horizontal)
                    
                    HStack {
                        Text("After")
                            .font(.custom(.medium, size: 16))
                            .foregroundStyle(Color.custom.textWhite)
                            .padding()
                        
                        Spacer()
                        
                        Stepper(value: $timeInterval, in: 30...60) {
                            Text("Sec: \(Int(timeInterval))")
                        }
                        .padding()
                        .onChange(of: timeInterval) { newTimeInterval in
                            print("Новое значение времени: \(newTimeInterval)")
                            isSwitchOn = false
                        }
                    }
                    
                    
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(Color.custom.primarySoft)
                )
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle("Notification")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    NotificationView()
}
