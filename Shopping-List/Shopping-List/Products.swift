//
//  Products.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 20/09/2026.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    var price: Double
    var category: String
    var isPurchased: Bool = false
}
