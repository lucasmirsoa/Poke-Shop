//
//  PurchaseCell.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit
import Alamofire
import AlamofireImage

class PurchaseCell: UITableViewCell {

    @IBOutlet private weak var purchaseImage: UIImageView!
    @IBOutlet private weak var purchaseName: UILabel!
    @IBOutlet private weak var cardNumber: UILabel!
    @IBOutlet private weak var purchasePrice: UILabel!
    @IBOutlet private weak var purchaseDate: UILabel!
}

// MARK: - Public methods

extension PurchaseCell {
    
    func fillOutlets(with purchase: Purchase) {
        
        self.purchaseName.text = purchase.name
        self.cardNumber.text = purchase.cardNumber
        self.purchasePrice.text = purchase.price
        self.purchaseDate.text = purchase.date
        
        AF.request(purchase.image).responseImage { response in
            if case .success(let image) = response.result {
                self.purchaseImage.image = image
            }
        }
    }
}
