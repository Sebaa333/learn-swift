//
//  WifiDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct WifiDetailView: View {
    @State private var isOn = false
    
    var body: some View {
        List{
            Section{
                Toggle(isOn: $isOn) {
                    SettingsRowView(name: "Wi-Fi", color: .blue, icon: "wifi")
                }
                
            }
            Section("red conocida"){
                    NetworkRowView(name: "Red wifi 1 ", isLocked: false)
                    NetworkRowView(name: "Red wifi 2 ", isLocked: false)
                    NetworkRowView(name: "Red wifi 3 ", isLocked: false)
            }
            if isOn{
                Section("redes nuevas "){
                    NetworkRowView(name: "Red wifi 4 ", isLocked: true)
                    NetworkRowView(name: "Red wifi 5 ", isLocked: true)
                    NetworkRowView(name: "Red wifi 6 ", isLocked: true)
                }
            }
            
            
        }
        .navigationTitle("Wi-Fi")
        .animation(.default, value: isOn)
    }
}

#Preview {
    NavigationStack{
        
        WifiDetailView()
    }
}
