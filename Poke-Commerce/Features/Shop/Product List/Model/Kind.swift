//
//  Kind.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 24/06/21.
//

import UIKit

enum Kind: String, Decodable {
    
    case normal = "Normal"
    case grass = "Grass"
    case fire = "Fire"
    case water = "Water"
    case fighting = "Fighting"
    case flying = "Flying"
    case poison = "Poison"
    case ground = "Ground"
    case rock = "Rock"
    case bug = "Bug"
    case ghost = "Ghost"
    case electric = "Electric"
    case pyschic = "Psychic"
    case ice = "Ice"
    case dragon = "Dragon"
    case dark = "Dark"
    case steel = "Steel"
    case fairy = "Fairy"
    
    var image: UIImage {
        
        switch self {
        case .normal: return self.sprite(position: CGPoint(x: 5, y: 20))
        case .grass: return self.sprite(position: CGPoint(x: 5, y: 150))
        case .fire: return self.sprite(position: CGPoint(x: 5, y: 280))
        case .water: return self.sprite(position: CGPoint(x: 5, y: 410))
        case .fighting: return self.sprite(position: CGPoint(x: 5, y: 535))
        case .flying: return self.sprite(position: CGPoint(x: 5, y: 660))
        case .poison: return self.sprite(position: CGPoint(x: 5, y: 785))
        case .ground: return self.sprite(position: CGPoint(x: 5, y: 915))
        case .rock: return self.sprite(position: CGPoint(x: 5, y: 1040))
        case .bug: return self.sprite(position: CGPoint(x: 5, y: 1165))
        case .ghost: return self.sprite(position: CGPoint(x: 5, y: 1295))
        case .electric: return self.sprite(position: CGPoint(x: 5, y: 1415))
        case .pyschic: return self.sprite(position: CGPoint(x: 5, y: 1545))
        case .ice: return self.sprite(position: CGPoint(x: 5, y: 1670))
        case .dragon: return self.sprite(position: CGPoint(x: 5, y: 1800))
        case .dark: return self.sprite(position: CGPoint(x: 5, y: 1930))
        case .steel: return self.sprite(position: CGPoint(x: 5, y: 2055))
        case .fairy: return self.sprite(position: CGPoint(x: 5, y: 2185))
        }
    }
    
    private func sprite(position: CGPoint) -> UIImage {
        
        let widthToCroop = CGFloat(335)
        let heightToCroop = CGFloat(120)
        
        let contextImage = #imageLiteral(resourceName: "types")
        let cropRect = CGRect(x: position.x, y: position.y, width: widthToCroop, height: heightToCroop)
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: cropRect)!
        let image = UIImage(cgImage: imageRef, scale: contextImage.scale, orientation: contextImage.imageOrientation)
        
        return image
    }
}
