//
//  PurchaseLocalServiceManager.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 27/06/21.
//

import RealmSwift
import UIKit


final class PurchaseLocalServiceManager {
    
    private let realmDB = {
        return LocalServiceManager.shared.dataBase
    }()
    
    func getPurchases() -> [Purchase] {
        
        guard let dataBase = self.realmDB else { return [Purchase]() }
        
        let purchases = dataBase.objects(PurchaseRealm.self).sorted(byKeyPath: "date", ascending: true)
        
        return self.parse(with: purchases)
    }
    
    func savePurchase(with purchase: Purchase) {
        
        guard let dataBase = self.realmDB else { return }
        
        try! dataBase.write {
            dataBase.add(self.parse(with: purchase))
        }
    }
}


// MARK: - Private methods

extension PurchaseLocalServiceManager {
    
    private func parse(with purchases: RealmSwift.Results<PurchaseRealm>) -> [Purchase] {
        
        return purchases.compactMap { Purchase(name: $0.name, price: $0.price, cardNumber: $0.cardNumber, image: $0.image, date: $0.date) }
    }
    
    private func parse(with purchase: Purchase) -> PurchaseRealm {
        
        let purchaseRealm = PurchaseRealm()
        purchaseRealm.name = purchase.name
        purchaseRealm.price = purchase.price
        purchaseRealm.cardNumber = purchase.cardNumber
        purchaseRealm.date = purchase.date
        purchaseRealm.image = purchase.image
        
        return purchaseRealm
    }
}
