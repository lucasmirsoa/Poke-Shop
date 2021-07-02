//
//  Category.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 22/06/21.
//

import Foundation

struct Category: Decodable {
    
    let id: Int
    let section: String
    let price: String
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case section = "section"
        case price = "price"
        case products = "pokemons"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.section = try values.decode(String.self, forKey: .section)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        self.price = formatter.string(from: NSNumber(value: try values.decode(Int.self, forKey: .price))) ?? ""
        
        self.products = try values.decode([Product].self, forKey: .products)
    }
    
    init(id: Int, section: String, price: String, products: [Product]) {
        self.id = id
        self.section = section
        self.price = price
        self.products = products
    }
}
