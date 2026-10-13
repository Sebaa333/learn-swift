//
//  SettingsRowView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 11/10/2026.
//

import SwiftUI

struct SettingsRowView: View {
    let name: String
    let color: Color
    let icon : String
    
    var body: some View {
        Label {
            Text(name)
        } icon: {
            SettingsIconView(icon: icon, color: color)
        }
    }
}

#Preview {
    SettingsRowView(name: "Option", color: .blue, icon: "airplane")
}
