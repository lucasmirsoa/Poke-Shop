//
//  CreditCardStep.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit

class CreditCardStep: UIView {
    
    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var cardNumber: UITextField!
    @IBOutlet private weak var cardMonth: UITextField!
    @IBOutlet private weak var cardYear: UITextField!
    @IBOutlet private weak var cvv: UITextField!
    
    var storeView: StoreViewProtocol?
}


// MARK: Actions

extension CreditCardStep {

    @IBAction private func declineTapped(_ sender: UIButton) {
        storeView?.declined()
    }
    
    @IBAction private func confirmTapped(_ sender: UIButton) {
        
        let creditCard = CreditCard(userName: name.text ?? "",
                                    cardNumber: cardNumber.text ?? "",
                                    cardMonth: cardMonth.text ?? "",
                                    cardYear: cardYear.text ?? "",
                                    cardCvv: cvv.text ?? "")
        
        storeView?.storageCreditCard(with: creditCard)
    }
}
