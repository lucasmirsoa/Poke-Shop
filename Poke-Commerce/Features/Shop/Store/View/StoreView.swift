//
//  StoreView.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 28/06/21.
//

import UIKit

class StoreView: UIViewController {
    
    private lazy var presenter: StorePresenter = {
        StorePresenter(view: self)
    }()
    
    private lazy var joyAsking1View = Bundle.main.loadNibNamed(JoyAskingStep1.identifier, owner: self, options: nil)?[0] as! JoyAskingStep1
    private lazy var joyAsking2View = Bundle.main.loadNibNamed(JoyAskingStep2.identifier, owner: self, options: nil)?[0] as! JoyAskingStep2
    private lazy var creditCardView = Bundle.main.loadNibNamed(CreditCardStep.identifier, owner: self, options: nil)?[0] as! CreditCardStep
    private lazy var purchaseView = Bundle.main.loadNibNamed(PurchaseStep.identifier, owner: self, options: nil)?[0] as! PurchaseStep
    
    private lazy var spinner = Loader(size: .larger)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.showNextStep()
    }
}


// MARK: - Private methods

extension StoreView {

    private func addSubviewWithBottomAnchor(with view: UIView) {
        
        let margins = self.view.layoutMarginsGuide
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -16).isActive = true
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 16).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    private func addSubviewWithTopAnchor(with view: UIView) {
        
        let margins = self.view.layoutMarginsGuide
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -16).isActive = true
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 16).isActive = true
        view.topAnchor.constraint(equalTo: margins.topAnchor, constant: 58).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    private func addSubviewWithFullView(with view: UIView) {
        
        let margins = self.view.layoutMarginsGuide
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -16).isActive = true
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 16).isActive = true
        view.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}

// MARK: - Store view protocol

extension StoreView: StoreViewProtocol {
    
    func setProductDetail(with productDetail: ProductDetail?) {
        self.presenter.setProductDetail(with: productDetail)
    }
    
    func jumpToNextStep() {
        self.view.subviews.last?.removeFromSuperview()
        self.presenter.showNextStep()
    }
    
    func showStep1() {
        
        self.joyAsking1View.storeView = self
        
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.addSubviewWithBottomAnchor(with: self.joyAsking1View) },
                          completion: nil)
    }
    
    func showStep2() {
        
        self.joyAsking2View.storeView = self
        
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithBottomAnchor(with: self.joyAsking2View) },
                          completion: nil)
    }
    
    func showCreditCardStep() {
        
        self.creditCardView.storeView = self
        
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithTopAnchor(with: self.creditCardView) },
                          completion: nil)
    }
    
    func showPurchaseStep(with item: ProductDetail) {
        
        self.purchaseView.storeView = self
        self.purchaseView.fillOutlets(with: item)
        
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithTopAnchor(with: self.purchaseView) },
                          completion: nil)
    }
    
    func declined() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func storageCreditCard(with creditCard: CreditCard) {
        
        self.presenter.storageCreditCard(with: creditCard, success: {
            self.jumpToNextStep()
        },
        fail: {
            self.showAlert(with: "Credit Card Problem",
                           message: "Dosen't take this so serious, but this credit card is far far away from an original one, right?",
                           buttonTitle: "OK", action: {})
        })
    }
    
    func creditCardCofirmed() {
        self.jumpToNextStep()
    }
    
    func purchaseFinished() {
        self.showLoading()
        self.presenter.doTransaction()
    }
    
    func showTransactionSuccessAndClose() {
        self.showAlert(with: "Success", message: "Transaction done, your purchase was registered!", buttonTitle: "OK", action: {
            self.navigationController?.popToRootViewController(animated: true)
        })
    }
    
    func showLoading() {
        spinner.start(on: self.view)
    }
    
    func hideLoading() {
        spinner.stop()
    }
    
    func showAlert(with title: String, message: String, buttonTitle: String, action: @escaping ()->()) {
    
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: buttonTitle, style: .destructive, handler: { _ in
            action()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

