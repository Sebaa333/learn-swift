//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by sebastian santivanez on 11/07/2026.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView{
            
                List{
                    ForEach(MockData.frameworks){ framework in
                        NavigationLink(destination:FrameworkDetailView(framework:framework,         isShowingDetailView:$viewModel.isShowingDetailView)){
                                FrameworkTitleView(framework: framework)
                        }
                    }
                }
                .navigationTitle("🍎 Frameworks")
            }
        .accentColor(Color(.label))
        }
    }

#Preview {
    FrameworkGridView()
}
