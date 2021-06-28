//
//  ProductCollectionCell.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 22/06/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ProductCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
}

extension ProductCollectionCell {

    func fillOutlets(with product: Product) {
        
        self.name.text = product.name
        self.loadImage(from: product.image)
    }
    
    private func loadImage(from url: String) {
        
        AF.request(url).responseImage { response in
            if case .success(let image) = response.result {
                self.image.image = image
            }
        }
    }
}
