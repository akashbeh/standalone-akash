//
//

import SwiftUI

struct SearchView: View {
    @State var loading = false
    @State var java_button = true
    @State var address = ""
    @State var server: Server?
    @State var errorReason: APIError?
    @State var java = true
    
    func printError(apiError: APIError) -> String {
        switch apiError {
        case APIError.notURL:
            return "Invalid URL"
        case APIError.notFound:
            return "Server not found"
        case APIError.decodingError:
            return "Invalid server data"
        case APIError.unexpectedError:
            return "Oops! Error"
        }
    }
    
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
                if loading {
                    ProgressView()
                } else {
                    if let loadedServer = server {
                        ServerView(server: loadedServer, java: java)
                        ServerView2(server: loadedServer, java: java)
                        ServerView3(server: loadedServer, java: java)
                    } else {
                        if let someError = errorReason {
                            Text(printError(apiError: someError))
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
            errorReason = (error as? APIError) ?? APIError.unexpectedError
        }
        loading = false
        return
    }

}
