//
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var serverData: ServerData
    
    @State var text = ""
    @State var serverIndices = [Int]()
    @State var loading = false
    
    @State var noSearches = true
    
    func findServers(input: String) {
        noSearches = false
        
        loading = true
        serverIndices = [Int]()
        var index = 0
        let inputLower = input.lowercased()
        for serverInData in serverData.servers {
            if serverInData.hostname.lowercased().contains(inputLower) || serverInData.ip.lowercased().contains(input) {
                serverIndices.append(index)
                continue
            }
            if let serverName = serverInData.name {
                if serverName.lowercased().contains(inputLower) {
                    serverIndices.append(index)
                    continue
                }
            }
            index += 1
        }
        loading = false
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Search servers")
                    .font(.title)
                    .padding()
                
                TextField(
                    "Enter an IP address...",
                    text: $text
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.black)
                .onSubmit{
                    findServers(input: text)
                }
                
                
                if loading {
                    ProgressView()
                } else {
                    if let serverIndicesExist = serverIndices {
                        if serverIndicesExist.count > 0 {
                            List {
                                ForEach(serverIndicesExist, id: \.self) { number in
                                    //                        Text(server.hostname)
                                    NavigationLink(
                                        serverData.servers[number].getName()
                                    ) {
                                        CombinedServerView(server: $serverData.servers[number])
                                    }
                                }
                            }
                            .listStyle(GroupedListStyle())
                            .cornerRadius(10)
                        } else {
                            if !noSearches {
                                Text("No servers found")
                            }
                        }
                    } else {
                        if let someError = serverData.error {
                            Text(someError.printError())
                        } else {
                            Button(action: {
                                findServers(input: text)
                            }) {
                                Text("Load search")
                            }
                        }
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .shadow(radius: 0.25)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
    
}
