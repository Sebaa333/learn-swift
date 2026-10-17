//
//  SoundDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct SoundDetailView: View {
    @State private var volume = 0.5
    var body: some View {
        List{
            Section("Ringtone and alets"){
                HStack{
                    Image(systemName: "speaker.fill")
                    
                    Slider(value: $volume, in: 0...1)
                    
                    Image(systemName: "speaker.wave.3.fill")
                }
                
                Text("Volume: \(Int(volume * 100))%")
            }
        }
        .navigationTitle("Sounds")
    }
}

#Preview {
    NavigationStack{
        SoundDetailView()
    }
}
