//
//  ContentView.swift
//  Assignment_0221
//
//  Created by keckuser on 2/19/24.
//

import SwiftUI

struct SearchView: View {
    @State var loading = false
    @State var java_button = true
    @State var address = ""
    @State var server: Server?
    @State var errorReason: Error?
    @State var java = true
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    if java_button {
                        Text("Java")
                    } else {
                        Text("Bedrock")
                    }
                    Spacer()
                    Toggle("",isOn: $java_button)
                }.padding()
                
                TextField(
                    "Enter an IP address...",
                    text: $address
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.black)
                .onSubmit{
                    Task {
                        await loadServer(address: address)
                        java = java_button
                    }
                }
                
                
                Text("Server Info")
                    .font(.title)
                    .padding()
                
                if let loadedServer = server {
                    ServerView(server: loadedServer, java: java)
                } else {
                    if let someError = errorReason {
                        switch someError {
                        case APIError.notFound:
                            Text("Server not found")
                        case APIError.decodingError:
                            Text("Invalid server data")
                        case APIError.unexpectedError:
                            Text("Oops! Error")
                        default:
                            ProgressView()
                        }
                    }
                }
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 0.25)
        )
    }
    
    

    func loadServer(address: String) async {
        loading = true
        do {
            let loadedServer = try await getServer(address: address, java: java)
            server = loadedServer
        } catch {
            server = nil
            errorReason = error
        }
        loading = false
        return
    }

}
