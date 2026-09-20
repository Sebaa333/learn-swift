//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by sebastian santivanez on 15/07/2026.
//

import SwiftUI

struct AFButton: View {
    var title : String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}

#Preview {
    AFButton(title: "Test Title")
}
