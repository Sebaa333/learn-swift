//
//  SettingsIconView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 08/10/2026.
//

import SwiftUI

struct SettingsIconView: View {
    let icon: String
    let color: Color
    
    var body: some View {
        Image(systemName: icon)
            .foregroundStyle(.white)
            .frame(width: 30,height: 30)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 7))
    }
}

#Preview {
    SettingsIconView(icon: "airplane", color: .blue)
}
