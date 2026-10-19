//
//  SettingView.swift
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
                Section {
                    ForEach(SettingOption.connectivity) { option in
                        NavigationLink(value: option.screen) {
                            HStack {
                                SettingsRowView(name: option.name, color: option.color, icon: option.icon)
                                Spacer()
                                if let status = status(for: option.screen) {
                                    Text(status)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
                Section {
                    ForEach(SettingOption.general) { option in
                        NavigationLink(value: option.screen) {
                            HStack {
                                SettingsRowView(name: option.name, color: option.color, icon: option.icon)
                                Spacer()
                                if let status = status(for: option.screen) {
                                    Text(status)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationDestination(for: SettingScreen.self) { screen in
                destination(for: screen)
            }
        }
        
    }
    func status(for screen: SettingScreen) -> String? {
        switch screen {
            case .airplane: return store.isAirplaneModeOn ? "On" : "Off"
            case .wifi: return store.isWifiOn ? "On" : "Off"
            case .bluetooth: return store.isBluetoothOn ? "On" : "Off"
            default: return nil
        }
    }
    
    @ViewBuilder
    func destination(for screen: SettingScreen) -> some View {
        switch screen {
            case .airplane: AirplaneDetailView(store: store)
            case .wifi: WifiDetailView(store: store)
            case .bluetooth: BluetoothDetailView(store: store)
            case .general: GeneralDetailView()
            case .display: DisplayDetailView()
            case .sounds: SoundDetailView()
        }
    }
}

#Preview {
    SettingsView()
}
