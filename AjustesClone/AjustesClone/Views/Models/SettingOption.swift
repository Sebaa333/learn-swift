//
//  SettingOption.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 18/10/2026.
//

import SwiftUI

enum SettingScreen {
    case airplane, wifi, bluetooth, general, display, sounds
}

struct SettingOption: Identifiable {
    let name: String
    let icon: String
    let color: Color
    let screen: SettingScreen
    
    var id: SettingScreen { screen }
}

extension SettingOption {
    static let connectivity = [
        SettingOption(name: "Airplane Mode", icon: "airplane", color: .orange, screen: .airplane),
        SettingOption(name: "Wi-Fi", icon: "wifi", color: .blue, screen: .wifi),
        SettingOption(name: "Bluetooth", icon: "wave.3.right", color: .blue, screen: .bluetooth)
    ]
    
    static let general = [
        SettingOption(name: "General", icon: "gear", color: .gray, screen: .general),
        SettingOption(name: "Display & Brightness", icon: "sun.max.fill", color: .blue, screen: .display),
        SettingOption(name: "Sounds", icon: "speaker.wave.3.fill", color: .red, screen: .sounds)
    ]
}
