//
//  JoyAskingStep2.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit

class JoyAskingStep2: UIView {
    
    var storeView: StoreViewProtocol?
}


// MARK: Actions

extension JoyAskingStep2 {
    
    @IBAction private func givingInformationsAccepted(_ sender: UIButton) {
        storeView?.jumpToNextStep()
    }
    
    @IBAction private func givingInformationsDecline(_ sender: UIButton) {
        storeView?.declined()
    }
}
