//
//  ProductService.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 23/06/21.
//

import Foundation
import Alamofire

final class ProductListServiceManager: ProductListServiceProtocol {
    
    enum RequestResult {
        case success(viewItems: [Category])
        case fail(error: String)
    }
    
    func listCategories(completion: @escaping(_ result: RequestResult) -> Void) {
        
        guard let url = URL(string: ApiServiceManager.ApiURLs.list.rawValue) else {
            return debugPrint("URL at listCategories with problem")
        }
        
        AF.request(URLRequest(url: url)).response { response in
            
            if let error = response.error {
                return completion(RequestResult.fail(error: error.localizedDescription))
            }
            
            guard let data = response.data, let categories = try? JSONDecoder().decode([Category].self, from: data) else {
                return completion(RequestResult.fail(error: "Problems to parse categories in listCategories"))
            }

            completion(RequestResult.success(viewItems: categories))
        }
    }
}
