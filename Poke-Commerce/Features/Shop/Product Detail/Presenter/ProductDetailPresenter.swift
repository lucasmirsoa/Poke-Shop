//
//  ProductDetailPresenter.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 25/06/21.
//

import UIKit

final class ProductDetailPresenter {

    private unowned let view: ProductDetailViewProtocol
    
    // Storage properties
    private var viewItem: ProductDetail?
    
    init(view: ProductDetailViewProtocol) {
        self.view = view
    }
}


// MARK: - Private methods

extension ProductDetailPresenter {
    
    private func getBrackground(from: Product) -> UIImage {
        
        var background = UIImage()
        
        if from.types.contains(where: { $0 == .fire }) {
            background = #imageLiteral(resourceName: "fire-background")
        }
        else if from.types.contains(where: { $0 == .flying }) {
            background = #imageLiteral(resourceName: "sky-background")
        }
        else if from.types.contains(where: { $0 == .water }) {
            background = #imageLiteral(resourceName: "water-background")
        }
        else { background = #imageLiteral(resourceName: "default-background") }
        
        return background
    }
    
    private func getTypes(from: Product) -> [UIImage] {
        
        var types = [UIImage]()
        
        for type in from.types {
            types.append(type.image)
        }
        
        return types
    }
    
    private func getWeakness(from: Product) -> [UIImage] {
        
        var weakness = [UIImage]()
        
        for weak in from.weakness {
            weakness.append(weak.image)
        }
        
        return weakness
    }
}


// MARK: - Public methods

extension ProductDetailPresenter {

    func setProductDetail(with productDetail: ProductDetail?) {
        self.viewItem = productDetail
    }
    
    func getProductDetail() -> ProductDetail? {
        return self.viewItem
    }
    
    func viewDidLoad() {
        
        guard let productDetail = self.viewItem else {
            return print("View item at ProductDetailPresenter seems to be wrong")
        }
        self.view.fillOutlets(with: productDetail)
    }
}
