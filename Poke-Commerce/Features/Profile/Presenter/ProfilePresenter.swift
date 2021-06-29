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
        self.viewItems = purchaseDataManager.getPurchases()
        self.view.reloadTableView()
    }
    
    func getPurchase(to row: Int) -> Purchase {
        return self.viewItems[row]
    }
    
    func numberOfItems() -> Int {
        return self.viewItems.count
    }
    
    func heightForHeader() -> Int {
        if self.viewItems.count == 0 {
            return 300
        }
        return 50
    }
    
    func isEmptyCell() -> Bool {
        return self.viewItems.count == 0
    }
}
