//
//  ContentView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 08/10/2026.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var store = SettingsStore()
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    NavigationLink{
                        ProfileDetailView(name: store.profile.name, email: store.profile.email)
                    }label:{
                        ProfileRowView(name: store.profile.name, caption: store.profile.caption)
                        
                    }
                }
                Section{
                    NavigationLink{
                        AirplaneDetailView(store: store)
                    }label:{
                        HStack{
                            SettingsRowView(name: "Airplane Mode", color: .orange, icon: "airplane")
                            Spacer()
                            Text(store.isAirplaneModeOn ? "On": "Off")
                                .foregroundStyle(.secondary)
                        }
                        
                    }
                    NavigationLink{
                        WifiDetailView(store: store)
                    }label:{
                        HStack{
                            SettingsRowView(name: "Wi-Fi", color: .blue, icon: "wifi")
                            Spacer()
                            Text(store.isWifiOn ? "On" : "Off")
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    NavigationLink{
                        BluetoothDetailView(store: store)
                    }label:{
                        HStack{
                            SettingsRowView(name: "Bluetooth", color: .blue, icon: "wave.3.right")
                            Spacer()
                            Text(store.isBluetoothOn ? "On": "Off")
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                }
                Section{
                    NavigationLink{
                        GeneralDetailView()
                    }label:{
                        SettingsRowView(name: "General", color: .gray, icon: "gear")
                    }
                    NavigationLink{
                        DisplayDetailView()
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
