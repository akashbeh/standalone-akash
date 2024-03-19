//
//  IconView.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import SwiftUI

struct IconView: View {
    let server: Server
    @State var iconSuccess: UIImage?
    @State var loading = true
    @State var pos: CGFloat = -200
    
    var body: some View {
        VStack {
            if server.online {
                if let decodedimage = iconSuccess {
                    Image(uiImage: decodedimage)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                } else {
                    if loading {
                        ProgressView()
                    } else {
                        OfflineIcon()
                        // Shouldn't happen unless API is wack
                    }
                }
            } else {
                OfflineIcon()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        .offset(x: pos)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                withAnimation {
                    pos = 0
                }
            }
        }
        .task {
            do {
                iconSuccess = try await getIcon()
                loading = false
            } catch {
                print(error)
                loading = false
                iconSuccess = nil
            }
        }
    }
    
    enum IconError: Error {
        case ServerError
        case IndexError
        case DecodingError
        case UIError
        case Other
    }
    
    func getIcon() async throws -> UIImage {
        guard let loadedIcon = server.icon else {
            throw IconError.ServerError
        }
        
        let b64String = loadedIcon[22...]
        
        
        
        guard let iconDecoded: NSData = NSData(base64Encoded: b64String, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters) else {
            throw IconError.DecodingError
        }
        guard let decodedimage: UIImage = UIImage(data: iconDecoded as Data) else {
            throw IconError.UIError
        }
        return decodedimage
    }
    
}

extension String {
    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        return String(self[start...])
    }
}
