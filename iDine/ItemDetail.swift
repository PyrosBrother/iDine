//
//  ItemDetail.swift
//  iDine
//
//  Created by Stéphane HACOUT on 01/01/2020.
//  Copyright © 2020 Stéphane HACOUT. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing){
                Image (item.mainImage)
                    .cornerRadius(20.0)
                Text ("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset (x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            HStack () {
                Button("Order This") { self.order.add(item: self.item)
                }
                .font(.headline)
                .padding (.all, 7.0)
                .background(/*@START_MENU_TOKEN@*/Color.green/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                Text("\(item.price) € / unit").padding()
            }
            Spacer ()
        }
        .navigationBarTitle(Text (item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
