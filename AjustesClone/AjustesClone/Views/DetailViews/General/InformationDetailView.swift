//
//  InformationView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 17/10/2026.
//

import SwiftUI

struct InformationDetailView: View {
    var body: some View {
        List{
            LabeledContent("Model", value: "iPhone 16 Pro")
        }
        .navigationTitle("Information")
    }
}

#Preview {
    NavigationStack{
        InformationDetailView()
    }
}
