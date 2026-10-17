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
                        ProfileDetailView(name: "Sebastian Santivanez", caption: "Sebastian@gmail.com",)
                    }label:{
                        ProfileRowView(name: "Sebastian Santivanez", caption: "ios developer")
                        
                    }
                }
                Section{
                    NavigationLink{
                        AirplaneDetailView()
                    }label:{
                        SettingsRowView(name: "Airplane Mode", color: .orange, icon: "airplane")
                        
                    }
                    NavigationLink{
                        WifiDetailView()
                    }label:{
                        SettingsRowView(name: "Wi-Fi", color: .blue, icon: "wifi")
                    }
                    
                    NavigationLink{
                        BluetoothDetailView()
                    }label:{
                        SettingsRowView(name: "Bluetooth", color: .blue, icon: "wave.3.right")
                    }
                    
                }
                Section{
                    NavigationLink{
                        GeneralDetailView()
                    }label:{
                        SettingsRowView(name: "General", color: .gray, icon: "gear")
                    }
                    NavigationLink{
                        Text("Here is the Display and Brightess View")
                    }label:{
                        SettingsRowView(name: "Display and Brightness", color: .blue, icon: "sun.max.fill")
                    }
                    NavigationLink{
                       SoundDetailView()
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
