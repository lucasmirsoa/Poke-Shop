//
//  ProductListPresenter.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 21/06/21.
//

import UIKit

final class ProductListPresenter {
    
    private unowned let view: ProductListViewProtocol
    
    // Storage properties
    private var viewItems = [Category]()
    private var productDetailSelected: ProductDetail?
    
    init(view: ProductListViewProtocol) {
        self.view = view
    }
}


// MARK: - Private methods

extension ProductListPresenter {
    
    private func requestProducts() {
        
        ProductListServiceManager().listCategories {
            [weak self] success, categories in
            
            if let items = categories, success {
                self?.viewItems = items
                self?.stopLoading()
            } else {
                self?.stopLoading()
                debugPrint("Error in requestProducts() at ProductListPresenter")
            }
        }
    }
    
    private func requestError(message: String) {
        self.view.showAlertError(with: "Error", message: message, buttonTitle: "OK")
    }
    
    private func stopLoading() {
        view.hideLoading()
        view.reloadTableView()
    }
    
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

extension ProductListPresenter {
    
    func viewDidLoad() {
        self.view.showLoading()
        self.requestProducts()
    }
    
    func sectionsCount() -> Int {
        return self.viewItems.count
    }
    
    func sectionItem(by section: Int) -> Category {
        return viewItems[section]
    }
    
    func itemSelected(section: Int, row: Int) {
        let item = self.viewItems[section].products[row]
        self.productDetailSelected = ProductDetail(id: item.id, name: item.name, image: item.image, background: getBrackground(from: item), types: getTypes(from: item), weakness: getWeakness(from: item), description: item.description, price: self.viewItems[section].price)
    }
    
    func getProductDetailSelected() -> ProductDetail? {
        return self.productDetailSelected
    }
}
