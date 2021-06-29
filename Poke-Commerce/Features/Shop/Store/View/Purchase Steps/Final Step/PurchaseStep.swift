//
//  PurchaseStep.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit
import Alamofire
import AlamofireImage

class PurchaseStep: UIView {

    @IBOutlet private weak var purchaseImage: UIImageView!
    @IBOutlet private weak var purchaseName: UILabel!
    @IBOutlet private weak var purchasePrice: UILabel!
    
    var storeView: StoreViewProtocol?
}


// MARK: - Private Methods

extension PurchaseStep {
    
    func fillOutlets(with product: ProductDetail) {
        
        self.purchaseName.text = product.name
        self.purchasePrice.text = product.price
        
        AF.request(product.image).responseImage { response in
            if case .success(let image) = response.result {
                self.purchaseImage.image = image
            }
        }
    }
}


// MARK: - Actions

extension PurchaseStep {

    @IBAction private func decline(_ sender: UIButton) {
        storeView?.declined()
    }
    
    @IBAction private func confirm(_ sender: UIButton) {
        storeView?.purchaseFinished()
    }
}
