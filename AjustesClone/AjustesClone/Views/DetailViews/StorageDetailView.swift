//
//  StorageView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 17/10/2026.
//

import SwiftUI

struct StorageDetailView: View {
    var body: some View {
        List{
            Section {
                VStack(alignment: .leading) {
                    Text("Used: 89 GB of 128 GB")
                    ProgressView(value: 0.7)
                }
            }
            Section{
                LabeledContent("Apps", value: "45 GB")
                LabeledContent("Photos", value: "30 GB")
                LabeledContent("System", value: "14 GB")
            }
        }
        .navigationTitle("Storage")
    }
}

#Preview {
    NavigationStack{
    StorageDetailView()
    }
}
