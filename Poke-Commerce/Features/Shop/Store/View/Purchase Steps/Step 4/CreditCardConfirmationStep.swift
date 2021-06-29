//
//  CreditCardConfirmationStep.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit

class CreditCardConfirmationStep: UIView {

    @IBOutlet private weak var cardNumber: UILabel!
    @IBOutlet private weak var cvv: UILabel!
    @IBOutlet private weak var cardMonth: UILabel!
    @IBOutlet private weak var cardYear: UILabel!
    @IBOutlet private weak var userName: UILabel!
    
    var storeView: StoreViewProtocol?
}


// MARK: - Private methods

extension CreditCardConfirmationStep {

    func fillOutlets(with creditCard: CreditCard) {
        
        self.cardNumber.text = creditCard.cardNumber
        self.cardMonth.text = creditCard.cardMonth
        self.cardYear.text = creditCard.cardYear
        self.userName.text = creditCard.userName
        self.cvv.text = creditCard.cardCvv
    }
}


// MARK: - Actions

extension CreditCardConfirmationStep {
    
    @IBAction private func declineTapped(_ sender: UIButton) {
        storeView?.declined()
    }
    
    @IBAction private func confirmTapped(_ sender: UIButton) {
        storeView?.creditCardCofirmed()
    }
}
