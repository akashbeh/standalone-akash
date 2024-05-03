//
//  FavoritesView.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var serverData: ServerData

    @State var text = ""
    @State var serverIndices = [Int]()
    @State var loading = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
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


                Text("Server Info")
                    .font(.title)
                    .padding()
                if loading {
                    ProgressView()
                } else {
                    if let serverIndicesExist = serverIndices {
                        List {
                            ForEach(0...(serverIndicesExist.count-1), id: \.self) { number in
                                //                        Text(server.hostname)
                                NavigationLink(
                                    serverData.servers[number].getName()
                                ) {
                                    CombinedServerView(server: $serverData.servers[number])
                                }
                            }
                        }
                        .navigationTitle("Servers")
                        .listStyle(GroupedListStyle())
                    } else {
                        if let someError = serverData.error {
                            Text(someError.printError())
                        } else {
                            Button(action: findServers(input: text)) {
                                Text("Load search")
                            }
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



    func findServers(input: String) {
//        loading = true
//        do {
        loading = true
        serverIndices = [Int]()
        let index = 0
            for serverInData in serverData.servers {
                if serverInData.hostname == address {
                    serverIndices.append(serverInData)
                }
                index += 1
            }
        loading = false
//        } catch {
//            server = nil
//            errorHandler.error = (error as? AppError) ?? AppError.unexpectedError
//        }
//        loading = false
    }

}
