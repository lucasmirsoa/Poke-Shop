//
//  ProductListViewProtocol.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 21/06/21.
//

import UIKit

protocol ProductListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadTableView()
    func itemSelected(at: IndexPath)
    func showDetailView(viewController: UIViewController)
    func showAlertError(with title: String, message: String, buttonTitle: String)
}
