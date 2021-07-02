//
//  ProductListServiceProtocol.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 02/07/21.
//

protocol ProductListServiceProtocol {
    
    func listCategories(completion: @escaping(_ result: ProductListServiceManager.RequestResult) -> Void)
}
