//
//  SmallRow.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import SwiftUI

struct SmallRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
        .padding(.horizontal)
     }
}
