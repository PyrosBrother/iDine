//
//  ItemRow.swift
//  iDine
//
//  Created by Stéphane HACOUT on 01/01/2020.
//  Copyright © 2020 Stéphane HACOUT. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        NavigationLink (destination: ItemDetail (item: item)) {
            HStack {
                Image (item.thumbnailImage)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack (alignment: .leading, spacing: 2.0) {
                    Text(item.name)
                        .font(.headline)
                    Text ("\(item.price) €")
                }
                .layoutPriority(1)
                Spacer()
                ForEach (item.restrictions, id: \.self) { restriction in
                    Text (restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(.all, 5.0)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
