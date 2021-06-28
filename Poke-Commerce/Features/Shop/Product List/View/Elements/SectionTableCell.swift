//
//  SectionTableCell.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 22/06/21.
//

import UIKit

class SectionCell: UITableViewCell {
    @IBOutlet private weak var sectionTitle: UILabel!
    @IBOutlet private weak var price: UILabel!
}

extension SectionCell {
    
    func fillOutlets(with item: Category) {

        self.sectionTitle.text = item.section
        self.price.text = item.price
    }
}
