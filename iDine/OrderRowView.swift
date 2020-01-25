//
//  OrderRowView.swift
//  iDine
//
//  Created by Stéphane HACOUT on 18/01/2020.
//  Copyright © 2020 Stéphane HACOUT. All rights reserved.
//

import SwiftUI

struct OrderRowView: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    @State private var stepperValue = 1
    
    var body: some View {
        VStack (spacing: 5) {
            HStack () {
                Image (item.thumbnailImage)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                Text(item.name)
                Spacer ()
                Button(action: {
                    self.order.removeAll (item: self.item)
                }) {
                    Image(systemName: "trash")
                }
            }
            HStack () {
                Spacer ()
                Text ("\(item.price) € / unit")
                Stepper(onIncrement: {self.order.add (item: self.item)}, onDecrement: {self.order.remove (item: self.item)}) {
                    Text("")
                }.padding(.horizontal)
                Text("x \(self.order.numberOf (item))")
                Text("= \(self.order.numberOf (item) * item.price) €")
            }
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        OrderRowView(item: MenuItem.example).environmentObject(order)
    }
}
