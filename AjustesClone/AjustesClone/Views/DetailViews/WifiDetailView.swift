//
//  WifiDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct WifiDetailView: View {
    @Bindable var store: SettingsStore
    
    var body: some View {
        List{
            Section{
                Toggle(isOn: $store.isWifiOn) {
                    SettingsRowView(name: "Wi-Fi", color: .blue, icon: "wifi")
                }
                
            }
            Section("know networks"){
                    NetworkRowView(name: "Red wifi 1 ", isLocked: false)
                    NetworkRowView(name: "Red wifi 2 ", isLocked: false)
                    NetworkRowView(name: "Red wifi 3 ", isLocked: false)
            }
            if store.isWifiOn{
                Section("new networks"){
                    NetworkRowView(name: "Red wifi 4 ", isLocked: true)
                    NetworkRowView(name: "Red wifi 5 ", isLocked: true)
                    NetworkRowView(name: "Red wifi 6 ", isLocked: true)
                }
            }
            
            
        }
        .navigationTitle("Wi-Fi")
        .animation(.default, value: store.isWifiOn)
    }
}

#Preview {
    NavigationStack{
        WifiDetailView(store:SettingsStore())
    }
}
