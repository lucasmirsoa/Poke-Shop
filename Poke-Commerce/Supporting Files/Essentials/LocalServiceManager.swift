//
//  LocalServiceManager.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 27/06/21.
//

import RealmSwift
import UIKit

final class LocalServiceManager {
    
    static let shared = LocalServiceManager()
    
    let dataBase: Realm?
    
    private init() { self.dataBase = try! Realm() }
}
