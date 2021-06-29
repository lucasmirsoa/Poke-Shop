//
//  JoyAskingStep1.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit

class JoyAskingStep1: UIView {

    var storeView: StoreViewProtocol?
}


// MARK: Actions

extension JoyAskingStep1 {
    
    @IBAction private func jumpToNextStep(_ sender: UIButton) {
        storeView?.jumpToNextStep()
    }
}
