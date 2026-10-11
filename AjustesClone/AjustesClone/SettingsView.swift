//
//  ContentView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 08/10/2026.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack{
            List{
                Section{
                    NavigationLink{
                        Text("Here is the Profile View")
                    }label:{
                        ProfileRow(name: "Sebastian Santivanez", caption: "ios developer")
                        
                    }
                }
                Section{
                    NavigationLink{
                        Text("Here is the airplane View")
                    }label:{
                        SettingsRowView(name: "Airplane Mode", color: .orange, icon: "airplane")
                        
                    }
                    NavigationLink{
                        Text("Here is the wifi View")
                    }label:{
                        SettingsRowView(name: "Wi-Fi", color: .blue, icon: "wifi")
                    }
                    
                    NavigationLink{
                        Text("Here is the Bluetooth View")
                    }label:{
                        SettingsRowView(name: "Bluetooth", color: .blue, icon: "wave.3.right")
                    }
                    
                }
                Section{
                    NavigationLink{
                        Text("Here is the General View")
                    }label:{
                        SettingsRowView(name: "General", color: .gray, icon: "gear")
                    }
                    NavigationLink{
                        Text("Here is the Display and Brightess View")
                    }label:{
                        SettingsRowView(name: "Display and Brightness", color: .blue, icon: "sun.max.fill")
                    }
                    NavigationLink{
                        Text("Here is the sound View")
                    }label:{
                        SettingsRowView(name: "Sounds", color: .pink, icon: "speaker.wave.3.fill")
                    }
                    
                }
            }
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    SettingsView()
}
