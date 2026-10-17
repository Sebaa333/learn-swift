//
//  DisplayDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct DisplayDetailView: View {
    @State private var appearance = "Light"
    @State private var brightness = 0.7
    
    var body: some View {
        List {
            Section("Appearance") {
                Picker("Appearance", selection: $appearance) {
                    Text("Light").tag("Light")
                    Text("Dark").tag("Dark")
                }
                .pickerStyle(.segmented)
            }
            
            Section("Brightness") {
                HStack {
                    Image(systemName: "sun.min")
                    Slider(value: $brightness, in: 0...1)
                    Image(systemName: "sun.max")
                }
            }
        }
        .navigationTitle("Display & Brightness")
        .preferredColorScheme(appearance == "Dark" ? .dark : .light)
    }
}

#Preview {
    NavigationStack {
        DisplayDetailView()
    }
}
