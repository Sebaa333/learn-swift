//
//  ContentView.swift
//  Appetizers
//
//  Created by sebastian santivanez on 17/08/2026.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
           AppetizerListView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
            
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}
