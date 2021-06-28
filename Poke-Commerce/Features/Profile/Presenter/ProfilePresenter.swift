//
//  ProfilePresenter.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 27/06/21.
//

final class ProfilePresenter {
    
    private unowned let view: ProfileViewProtocol
    private let purchaseDataManager = PurchaseLocalServiceManager()
    
    // Storage properties
    private var viewItems: [Purchase] = []
    
    init(view: ProfileViewProtocol) {
        self.view = view
    }
}

// MARK: - Public methods

extension ProfilePresenter {
    
    func viewWillAppear() {
        self.updateStorageItems()
    }
    
    func getPurchase(to row: Int) -> Purchase {
        return self.viewItems[row]
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(to section: Int) -> Int {
        if section == 0 { return 0 }
        return self.viewItems.count
    }
    
    func heightForHeader(to section: Int) -> Int {
        if section == 0 { return 300 }
        return 50
    }
}

// MARK: - Private methods

extension ProfilePresenter {

    private func updateStorageItems() {
        
        self.viewItems = purchaseDataManager.getPurchases()
        self.view.reloadTableView()
    }
    
//    private func currentDate() -> String {
//
//        let date = Date()
//        let calendar = Calendar.current
//
//        let year = calendar.component(.year, from: date)
//        let month = calendar.component(.month, from: date)
//        let day = calendar.component(.day, from: date)
//        let hour = calendar.component(.hour, from: date)
//        let minutes = calendar.component(.minute, from: date)
//        let seconds = calendar.component(.second, from: date)
//
//        return "\(day)/\(month)/\(year) - \(hour):\(minutes):\(seconds)"
//    }
}
