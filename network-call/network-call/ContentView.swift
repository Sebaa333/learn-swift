//
//  ContentView.swift
//  network-call
//
//  Created by sebastian santivanez on 23/09/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var user: GithubUser?
    
    var body: some View {
        VStack (spacing: 20){
        AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
        } placeholder: {
            Circle()
                .foregroundColor(.secondary)
                
        }
        .frame(width: 120, height: 120)
        
    
        Text(user?.login ?? "Login Placeholder")
                .bold()
                .font(.title3)
            
            Text(user?.bio ?? "Bio placeholder")
                .padding()
            Spacer()
        }
        
        .padding()
        .task {
            do{
                user = try await getUser()
            } catch GHError.invalidUrl{
                print("invalid URL")
            } catch GHError.invalideResponse{
                print("invalid Response ")
            } catch GHError.invalidData{
                print("invalid Data")
            }catch{
                print("unexpected error")
            }
        }
    }
    func getUser() async throws -> GithubUser{
        let endpoint = "https://api.github.com/users/sallen0400"
        
        guard let url = URL(string: endpoint) else{
            throw GHError.invalidUrl
            
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw  GHError.invalideResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
        } catch{
            throw GHError.invalidData
        }
    }
}

#Preview {
    ContentView()
}


struct GithubUser: Codable {
    let login:String
    let avatarUrl: String
    let bio: String
    
}


enum GHError : Error {
    case invalidUrl
    case invalideResponse
    case invalidData
}
