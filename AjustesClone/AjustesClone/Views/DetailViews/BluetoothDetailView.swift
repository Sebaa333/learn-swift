//
//  BluetoothDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//
import SwiftUI

struct BluetoothDetailView: View {
    @State private var isOn = false
    
    var body: some View {
        List {
            Section {
                Toggle(isOn: $isOn) {
                    SettingsRowView(name: "Bluetooth", color: .blue, icon: "wave.3.right")
                }
            }
            
            if isOn {
                Section("Mis dispositivos") {
                    BluetoothRowView(name: "AirPods", isConnected: true)
                    BluetoothRowView(name: "Parlante JBL", isConnected: false)
                }
            }
        }
        .navigationTitle("Bluetooth")
        .animation(.default, value: isOn)
    }
}

#Preview {
    NavigationStack {
        BluetoothDetailView()
    }
}
