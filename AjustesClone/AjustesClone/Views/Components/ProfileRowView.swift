//
//  ProfileRow.swift
//  AjustesClone
//
//  Created by sebastian santivanez on 08/10/2026.
//

import SwiftUI

struct ProfileRowView: View {
    
    let name: String
    let caption: String
    
    var initials: String {
        let words = name.split(separator: " ")
        var result = ""
        
        for word in words {
            if let firstLetter = word.first {
                result.append(firstLetter)
            }
        }
        
        return result
    }
    
    
    var body: some View {
        HStack{
            
            Circle()
                .fill(.gray)
                .frame(width: 60,height: 60,)
                .overlay{
                    Text(initials)
                        .foregroundStyle(.white)
                        .font(.title)
                    
                    
                }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.headline)
                Text(caption)
                    .foregroundStyle(.secondary)
                
                
            }
            
        }
    }
    
}

#Preview {
    ProfileRowView(name: "Sebastian Santivanez", caption: "ios developer",)
}
