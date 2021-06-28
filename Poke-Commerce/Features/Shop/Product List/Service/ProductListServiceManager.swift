//
//  ProductService.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 23/06/21.
//

import Foundation
import Alamofire

final class ProductListServiceManager {
    
    func listCategories(completion: @escaping(_ success: Bool, _ categories: [Category]?) -> Void) {
        
        guard let url = URL(string: ApiServiceManager.ApiURLs.list.rawValue) else {
            return debugPrint("URL at listCategories with problem")
        }
        
        AF.request(URLRequest(url: url)).response { response in
            
            if let _ = response.error {
                return completion(false, nil)
            }
            
            guard let data = response.data, let categories = try? JSONDecoder().decode([Category].self, from: data) else {
                debugPrint("Problems to parse categories in listCategories")
                return completion(false, nil)
            }

            completion(true, categories)
        }
    }
}
