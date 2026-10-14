//
//  BluetoothRowView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct BluetoothRowView: View {
    let name: String
    let isConnected: Bool
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(isConnected ? "Conectado" : "No conectado")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    List {
        BluetoothRowView(name: "AirPods", isConnected: true)
        BluetoothRowView(name: "Parlante JBL", isConnected: false)
    }
}
