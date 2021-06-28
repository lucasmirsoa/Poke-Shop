//
//  ApiServiceManager.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 24/06/21.
//

final class ApiServiceManager {
    
    private init() { }

    enum ApiURLs: String {
        case list = "http://private-19d2e0-pokemon16.apiary-mock.com/products"
        case transaction = "https://private-57eb9b-transaction7.apiary-mock.com/poke_transaction"
    }
}
