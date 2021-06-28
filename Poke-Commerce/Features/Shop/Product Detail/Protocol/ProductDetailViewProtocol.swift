//
//  ProductDetailViewProtocol.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 25/06/21.
//

import UIKit

protocol ProductDetailViewProtocol : class {
    
    func fillOutlets(with product: ProductDetail)
    func presentStoreView(viewController: UIViewController)
}
