//
//  PurchaseServiceManager.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import Foundation
import Alamofire

final class PurchaseServiceManager {
    
    func makePurchase(with purchase: Purchase, completion: @escaping(_ success: Bool) -> Void) {
        
        guard let url = URL(string: ApiServiceManager.ApiURLs.transaction.rawValue) else {
            return debugPrint("URL at makePurchase with problem")
        }
        
        guard let body = try? JSONEncoder().encode(purchase) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.method = .post
        urlRequest.httpBody = body
        
        AF.request(urlRequest).response { response in
            
            if let _ = response.error { return completion(false) }

            completion(true)
        }
    }
}
