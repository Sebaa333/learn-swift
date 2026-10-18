//
//  GeneralDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 13/10/2026.
//

import SwiftUI

struct GeneralDetailView: View {
    var body: some View {
        
        List{
            Section{
                NavigationLink{
                    InformationDetailView()
                }label: {
                    SettingsRowView(name: "Information", color: .gray, icon: "info.circle")
                }
            }
            Section{
                NavigationLink{
                    StorageDetailView()
                }label:{
                    SettingsRowView(name: "Storage", color: .gray, icon: "externaldrive")
                }
            }
            Section{
                NavigationLink{
                    SoftwareUpdateDetailView()
                }label:{
                    SettingsRowView(name: "Software Update", color: .gray, icon: "gear.badge")
                }
            }
            
        }
        .navigationTitle("General")
    }
}


#Preview {
    NavigationStack{
        GeneralDetailView()
    }
}
