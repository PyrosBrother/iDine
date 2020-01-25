//
//  AppView.swift
//  iDine
//
//  Created by Stéphane HACOUT on 03/01/2020.
//  Copyright © 2020 Stéphane HACOUT. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            if (order.itemCount>0) {
                OrderView()
                    .tabItem
                    {
                        Image(systemName: "square.and.pencil")
                        Text("Order")
                }
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
