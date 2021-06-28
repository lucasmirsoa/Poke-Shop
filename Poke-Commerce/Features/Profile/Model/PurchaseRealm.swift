//
//  PurchaseRealm.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 27/06/21.
//

import RealmSwift
import Foundation

class PurchaseRealm: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var price = ""
    @objc dynamic var cardNumber = ""
    @objc dynamic var date = ""
    @objc dynamic var image = ""
}
