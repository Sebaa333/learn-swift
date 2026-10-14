//
//  AirplaneDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct AirplaneDetailView: View {
    @State private var isOn = false
    
    var body: some View {
        List{
            Toggle(isOn: $isOn) {
            
                SettingsRowView(name: "Airplane Mode", color: .orange, icon: "airplane")
            }
            
        }
        .navigationTitle("Airplane Mode")
    }
}

#Preview {
    NavigationStack {
        AirplaneDetailView()
    }
}
