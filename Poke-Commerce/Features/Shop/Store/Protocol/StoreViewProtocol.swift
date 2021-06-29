//
//  StoreViewProtocol.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit

protocol StoreViewProtocol : class {

    func jumpToNextStep()
    func showStep1()
    func showStep2()
    func showCreditCardStep()
    func showPurchaseStep(with productDetail: ProductDetail)
    func storageCreditCard(with creditCard: CreditCard)
    func creditCardCofirmed()
    func purchaseFinished()
    func showTransactionSuccessAndClose()
    func declined()
    func showLoading()
    func hideLoading()
    func showAlert(with title: String, message: String, buttonTitle: String)
}
