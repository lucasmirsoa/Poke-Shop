//
//  ProductListView.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 21/06/21.
//

import UIKit

class ProductListView: UITableViewController {
    
    private lazy var presenter: ProductListPresenter = {
        ProductListPresenter(view: self)
    }()
    
    private lazy var spinner = Loader(size: .larger)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLoading()
        self.presenter.requestProducts()
        self.navigationBarLayout()
        self.tableLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail", let productDetailView = (segue.destination as? ProductDetailView) {
            productDetailView.setProductDetail(with: self.presenter.getProductDetailSelected())
        }
    }
}

// MARK: - Private methods

extension ProductListView {
    
    private func navigationBarLayout() {
        
        self.navigationItem.title = "Póke-Shop"
        self.navigationController?.navigationBar.barTintColor = Colors.navigation.color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "PokemonSolidNormal", size: 25) ?? UIFont.boldSystemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white];
    }
    
    private func tableLayout() {
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func showTabBar() {
        (self.navigationController?.tabBarController as? TabbarView)?.setTabBarHidden(false)
    }
    
    private func hideTabBar() {
        (self.navigationController?.tabBarController as? TabbarView)?.setTabBarHidden(true)
    }
}

// MARK: - Table view data source

extension ProductListView {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.sectionsCount()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: SectionCell.identifier) as! SectionCell
        header.fillOutlets(with: presenter.sectionItem(by: section))
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(250)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableCell.identifier, for: indexPath) as! ProductTableCell
        cell.listView = self
        cell.products = presenter.sectionItem(by: indexPath.section).products
        cell.section = indexPath.section
        
        return cell
    }
}

// MARK: - List view protocol

extension ProductListView: ProductListViewProtocol {

    func showLoading() {
        self.spinner.start(on: self.view)
    }
    
    func hideLoading() {
        self.spinner.stop()
    }
    
    func reloadTableView() {
        UIView.transition(with: tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })
    }
    
    func itemSelected(at: IndexPath) {
        self.hideTabBar()
        self.presenter.itemSelected(section: at.section, row: at.row)
        self.performSegue(withIdentifier: "detail", sender: self)
    }
    
    func showDetailView(viewController: UIViewController) {
        self.navigationController?.show(viewController, sender: nil)
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
