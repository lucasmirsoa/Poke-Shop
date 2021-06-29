//
//  StorePresenter.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit

final class StorePresenter {

    private unowned let view: StoreViewProtocol
    
    // Storage properties
    private var viewItem: ProductDetail?
    private var creditCard: CreditCard?
    private var nextStep = Steps.firstStep
    
    private enum Steps {
        case firstStep
        case secondStep
        case thirdStep
        case fourthStep
        case finished
    }
    
    init(view: StoreViewProtocol) {
        self.view = view
    }
}


// MARK: - Public Methods

extension StorePresenter {
    
    func setProductDetail(with productDetail: ProductDetail?) {
        self.viewItem = productDetail
    }

    func showNextStep() {
        
        switch nextStep {
        case .firstStep:
            self.view.showStep1()
            self.nextStep = .secondStep
            
        case .secondStep:
            self.view.showStep2()
            self.nextStep = .thirdStep
            
        case .thirdStep:
            self.view.showCreditCardStep()
            self.nextStep = .fourthStep
            
        case .fourthStep:
            guard let item = self.viewItem else {
                fatalError("Purchase cannot be completed, viewItem nil")
            }
            self.view.showPurchaseStep(with: item)
            self.nextStep = .finished
            
        case .finished:
            self.view.purchaseFinished()
        }
    }
    
    func storageCreditCard(with creditCard: CreditCard, success: @escaping() -> Void, fail: @escaping() -> Void) {
        
        guard self.checkIfItIsAValidCreditCard(with: creditCard) else {
            return fail()
        }
        
        self.creditCard = creditCard
        success()
    }
    
    func getCreditCard() -> CreditCard {
        return self.creditCard ?? CreditCard(userName: "", cardNumber: "", cardMonth: "", cardYear: "", cardCvv: "")
    }
    
    func doTransaction() {
        
        guard let item = self.viewItem else { return }
        guard let creditCard = self.creditCard else { return }
        
        let purchase = Purchase(name: item.name, price: item.price, cardNumber: creditCard.cardNumber, image: item.image, date: self.currentDate())
        
        PurchaseServiceManager().makePurchase(with: purchase) {
            success in
            
            if success {
                PurchaseLocalServiceManager().savePurchase(with: purchase)
                self.view.hideLoading()
                self.view.showTransactionSuccessAndClose()
            }
            else {
                self.view.showAlert(with: "Error", message: "We are experiencing some problems trying to complete your purchase, please try again later", buttonTitle: "OK")
                self.view.hideLoading()
            }
        }
    }
}

// MARK: - Private Methods

extension StorePresenter {
    
    private func checkIfItIsAValidCreditCard(with creditCard: CreditCard) -> Bool {
        
        if creditCard.userName.count < 2 {
            return false
        }
        else if creditCard.cardCvv.count < 3 {
            return false
        }
        else if creditCard.cardMonth.count < 2 {
            return false
        }
        else if creditCard.cardNumber.count < 16 {
            return false
        }
        else if creditCard.cardYear.count < 4 {
            return false
        }
        else { return true }
    }
    
    private func currentDate() -> String {

        let date = Date()
        let calendar = Calendar.current

        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)

        return "\(day)/\(month)/\(year) - \(hour):\(minutes):\(seconds)"
    }
}
