//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    @Published var items = [MenuItem]()
    
    var itemCount: Int {
        return items.count
    }
    
    var differentsItem: [MenuItem] {
        return items.reduce([], {
            $0.contains($1) ? $0 : $0 + [$1]
        })
    }
    
    var listSections: [String] {
        let listSectionsIDs = items.reduce([], {
            $0.contains($1.sectionId) ? $0 : $0 + [$1.sectionId]
        })
        return [String]()
    }
    
    var differentsItemCount: Int {
        return differentsItem.count
    }
    
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
//    func listeSections () -> [String] {
//        return items.reduce([], {
//            $0.contains($1.) ? $0 : $0 + [$1]
//        })
//    }

    func numberOf (_ item: MenuItem) -> Int {
        return items.filter({
            $0.id == item.id
            }).count
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func removeAll(item: MenuItem) {
        items = items.filter {$0 != item}
    }
}
