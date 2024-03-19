//
//  ServerRow.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import SwiftUI

struct ServerRow: View {
    let title: String
    let value: String
    
    var body: some View {
         HStack {
             Text(title)
                 .fontWeight(.bold)
             Spacer()
             Text(value)
         }
         .padding(.vertical)
     }
}
