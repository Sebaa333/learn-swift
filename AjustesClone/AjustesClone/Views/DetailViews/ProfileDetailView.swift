//
//  ProfileDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 12/10/2026.
//

import SwiftUI

struct ProfileDetailView: View {
    let name: String
    let email: String
    
    var body: some View {
        List{
            VStack(alignment: .center){
                Circle()
                    .fill(.gray)
                    .frame(width: 90,height: 90,)
                    .overlay{
                        Image(systemName: "person.fill")
                            .foregroundStyle(.white)
                            .font(.system(size: 40))
                    }
                
                Text(name)
                    .font(.headline)
                Text(email)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .listRowBackground(Color.clear)
            
            Section("Account"){
                SettingsRowView(name: "Account", color: .gray, icon: "person.crop.circle")
                
                SettingsRowView(name: "Icloud", color: .blue, icon: "icloud.fill")
                
                SettingsRowView(name: "Devices", color: .gray, icon: "display")
                
            }
            Section("Security"){
                SettingsRowView(name: "Password", color: .gray, icon: "touchid")
                
                SettingsRowView(name: "Subscription", color: .gray, icon: "arrow.clockwise.circle.fill")
                
                SettingsRowView(name: "Apple Pay", color: .gray, icon: "creditcard.fill")
            }
        }
        
        
    }
}

#Preview {
    ProfileDetailView(name: "Sebastian Santivanez", email: "Sebastian@gmail.com",)
}
