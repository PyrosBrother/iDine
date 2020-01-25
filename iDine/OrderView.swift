//
//  OrderView.swift
//  iDine
//
//  Created by Stéphane HACOUT on 03/01/2020.
//  Copyright © 2020 Stéphane HACOUT. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            VStack {
                if (order.itemCount>0) {
                    NavigationLink(destination: Text("Check out")) {
                        HStack {
                            Text("Place Order")
                            Spacer ()
                            Text ("\(order.itemCount) items :")
                            Text ("\(order.total) €")
                            } .padding()
                    }
                }
                Spacer ().frame(height: 15)
                Text ("Items")
                List {
                    Section {
                        //                ForEach (menu) {section in
                        //
                        //                    ForEach (order.sectionsOfDifferentsItem) {section in
                        //                        Section (header: Text(section.name)) {
                        //                            ForEach (section.items) { item in
                        
                        ForEach( order.differentsItem) { item in HStack {
                            OrderRowView(item: item)
                            }
                            //                              }
                            //                          }
                            //                        }
                            //                    }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
