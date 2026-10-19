//
//  SoftwareUpdateDetailView.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 17/10/2026.
//
import SwiftUI

struct SoftwareUpdateDetailView: View {
    @State private var isChecking = false
    @State private var isUpToDate = false
    
    var body: some View {
        List {
            
            Section {
                VStack(spacing: 8) {
                    Image(systemName: "gear.badge")
                        .font(.system(size: 60))
                        .foregroundStyle(.gray)
                    
                    Text("iOS 26.1")
                        .font(.title2)
                        .bold()
                    
                    if isChecking {
                        ProgressView()
                        Text("Checking for updates...")
                            .foregroundStyle(.secondary)
                    } else if isUpToDate {
                        Text("Your iPhone is up to date")
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)
            }
            Section {
                Button("Check for Updates") {
                    isChecking = true
                    isUpToDate = false
                    Task {
                        try? await Task.sleep(for: .seconds(2))
                        isChecking = false
                        isUpToDate = true
                    }
                }
                .disabled(isChecking)
            }
        }
        .navigationTitle("Software Update")
    }
}

#Preview {
    NavigationStack {
        SoftwareUpdateDetailView()
    }
}
