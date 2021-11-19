//
//  Model.swift
//  StoreManager
//
//  Created by DingyiKang on 11/18/21.
//

import Foundation
import UIKit

class Model {
    
    var items = [Item]()
    
    init () {
        for i in 1...3 {
            let item1 = Item(name: "Aurito\(i)", price: 1.4*Double(i), quantity: 3*i)
            let item2 = Item(name: "Burito\(i)", price: 2.5*Double(i), quantity: 7*i)
            let item3 = Item(name: "Curito\(i)", price: 2.4*Double(i), quantity: 11*i)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        }
    }
    
    
}
