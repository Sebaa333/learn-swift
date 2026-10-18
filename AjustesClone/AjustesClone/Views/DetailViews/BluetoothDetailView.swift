//
//  BluetoothDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//
import SwiftUI

struct BluetoothDetailView: View {
    @Bindable var store: SettingsStore
    
    var body: some View {
        List {
            Section {
                Toggle(isOn: $store.isBluetoothOn) {
                    SettingsRowView(name: "Bluetooth", color: .blue, icon: "wave.3.right")
                }
            }
            
            if store.isBluetoothOn {
                Section("Mis dispositivos") {
                    BluetoothRowView(name: "AirPods", isConnected: true)
                    BluetoothRowView(name: "Parlante JBL", isConnected: false)
                }
            }
        }
        .navigationTitle("Bluetooth")
        .animation(.default, value: store.isBluetoothOn)
    }
}

#Preview {
    NavigationStack {
        BluetoothDetailView(store:SettingsStore())
    }
}
