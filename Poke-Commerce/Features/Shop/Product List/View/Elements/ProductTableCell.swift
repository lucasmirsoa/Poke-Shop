//
//  ProductCell.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 22/06/21.
//

import UIKit

class ProductTableCell: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var listView: ProductListViewProtocol?
    var section: Int?
    var products = [Product]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customLayout()
    }
}

// MARK: - Private methods

extension ProductTableCell {

    private func customLayout() {
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let cellHeight = 230
        let cellWidth = Int(UIScreen.main.bounds.size.width * 2/3)
        
        layout?.scrollDirection = .horizontal
        layout?.itemSize = CGSize(width: cellWidth, height: cellHeight - 1)
    }
}

// MARK: - Collection view data source

extension ProductTableCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.identifier, for: indexPath) as! ProductCollectionCell
        cell.fillOutlets(with: self.products[indexPath.row])
        return cell
    }
}

// MARK: - Collection view delegate

extension ProductTableCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let section = self.section else { return }
        listView?.itemSelected(at: IndexPath(row: indexPath.row, section: section))
    }
}
