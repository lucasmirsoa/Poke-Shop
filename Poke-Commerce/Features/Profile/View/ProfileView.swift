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
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
}

// MARK: - Table view data source

extension ProfileView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(self.presenter.heightForHeader())
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if self.presenter.isEmptyCell() {
            let header = tableView.dequeueReusableCell(withIdentifier: "EmptyCell")
            self.tableView.backgroundColor = Colors.profile(type: .emptyProfile).color
            return header
        }
        
        let header = tableView.dequeueReusableCell(withIdentifier: "SectionCell")
        self.tableView.backgroundColor = Colors.profile(type: .commomProfile).color
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
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
