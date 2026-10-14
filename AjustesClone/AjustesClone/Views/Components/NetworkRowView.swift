//
//  NetworkRowView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct NetworkRowView: View {
    let name: String
    let isLocked: Bool
    var body: some View {
        
            HStack{
                Text(name)
                Spacer()
                if isLocked {
                    Image(systemName: "lock.fill")
                    .foregroundStyle(.secondary)
                }
                Image(systemName: "wifi")
            }
        
    }
}
#Preview {
    List {
        NetworkRowView(name: "red wifi1 ", isLocked: true)
    }
}
