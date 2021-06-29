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
}
