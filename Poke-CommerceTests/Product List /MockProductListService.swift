//
//  MockProductListService.swift
//  Poke-CommerceTests
//
//  Created by Lucas M Soares on 02/07/21.
//

@testable import Poke_Commerce

final class MockProductListService: ProductListServiceProtocol {
    
    let mockCategories: [Category]
    var requestResult: ProductListServiceManager.RequestResult
    
    init(categories: [Category] = [Category]()) {
        self.mockCategories = [
            Category(id: 1,
                     section: "common",
                     price: "R$ 1.500,00",
                     products: [
                        Product(id: 1,
                                name: "Pikachu",
                                description: "Bonitinho",
                                types: [Kind.electric],
                                weakness: [Kind.rock],
                                image: "http://vignette2.wikia.nocookie.net/pokemon/images/b/b1/025Pikachu_XY_anime_3.png/revision/latest?cb=20140902050035")
                     ]
            )
        ]
        
        self.requestResult = ProductListServiceManager.RequestResult.success(viewItems: self.mockCategories)
    }
    
    func listCategories(completion: @escaping (_ result: ProductListServiceManager.RequestResult) -> Void) {
        completion(self.requestResult)
    }
}
