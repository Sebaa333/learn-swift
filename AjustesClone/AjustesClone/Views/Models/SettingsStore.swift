//
//  SettingsStore.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 18/10/2026.
//

import SwiftUI

@Observable
class SettingsStore {
    var isWifiOn = false
    
    var isBluetoothOn = false {
        didSet {
            if isBluetoothOn {
                isAirplaneModeOn = false
            }
        }
    }
    
    var isAirplaneModeOn = false {
        didSet {
            if isAirplaneModeOn {
                isWifiOn = false
                isBluetoothOn = false
            }
        }
    }
}
