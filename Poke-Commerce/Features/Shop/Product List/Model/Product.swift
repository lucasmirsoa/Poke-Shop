//
//  Product.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 22/06/21.
//

import Foundation

struct Product: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let types: [Kind]
    let weakness: [Kind]
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case types = "types"
        case weakness = "weakness"
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.description = try values.decode(String.self, forKey: .description)
        self.types = try values.decode([Kind].self, forKey: .types)
        self.weakness = try values.decode([Kind].self, forKey: .weakness)
        self.image = try values.decode(String.self, forKey: .image)
    }
}
