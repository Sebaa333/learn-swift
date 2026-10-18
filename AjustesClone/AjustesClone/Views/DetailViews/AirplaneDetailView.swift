//
//  AirplaneDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct AirplaneDetailView: View {
    @Bindable var store: SettingsStore
    
    var body: some View {
        List{
            Toggle(isOn: $store.isAirplaneModeOn) {
            
                SettingsRowView(name: "Airplane Mode", color: .orange, icon: "airplane")
            }
            
        }
        .navigationTitle("Airplane Mode")
    }
}

#Preview {
    NavigationStack {
        AirplaneDetailView(store: SettingsStore())
    }
}
