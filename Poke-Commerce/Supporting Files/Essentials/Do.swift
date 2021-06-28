//
//  Do.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import Foundation

struct Do {
    
    static func wait(seconds: Double, completion: @escaping () -> Void) {
        
        let time = DispatchTime.now() + seconds
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            completion()
        }
    }
    
    static func now(completion: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            completion()
        }
    }
}
