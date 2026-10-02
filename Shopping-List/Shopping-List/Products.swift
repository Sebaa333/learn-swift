//
//  Products.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 20/09/2026.
//

import Foundation
import SwiftData

@Model
final class Product {
    var name: String
    var price: Double
    var category: String
    var isPurchased: Bool
    
    init(name: String, price: Double, category: String, isPurchased: Bool = false) {
        self.name = name
        self.price = price
        self.category = category
        self.isPurchased = isPurchased
    }
}
