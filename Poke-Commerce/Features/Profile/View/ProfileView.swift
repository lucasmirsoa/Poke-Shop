//
//  Profile.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 27/06/21.
//

import UIKit

class ProfileView: UITableViewController {
    
    private lazy var presenter: ProfilePresenter = {
        ProfilePresenter(view: self)
    }()
    
    private lazy var spinner = Loader(size: .larger)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }
}

// MARK: - Private methods

extension ProfileView {
    
    private func tableLayout() {
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

// MARK: - Table view data source

extension ProfileView {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfItems(to: section)
    }
    
    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat(self.presenter.heightForHeader(to: section))
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            
            let header = tableView.dequeueReusableCell(withIdentifier: "EmptyCell")
            return header
        }
        
        let header = tableView.dequeueReusableCell(withIdentifier: "SectionCell")
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseCell.identifier, for: indexPath) as! PurchaseCell
        cell.fillOutlets(with: presenter.getPurchase(to: indexPath.row))
        
        return cell
    }
}

// MARK: - Profile view protocol

extension ProfileView: ProfileViewProtocol {

    func showLoading() {
        spinner.start(on: self.view)
    }
    
    func hideLoading() {
        spinner.stop()
    }
    
    func reloadTableView() {
        UIView.transition(with: tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })
    }
}
