//
//  ProductTableViewCell.swift
//  FirstLesson
//
//  Created by alexey on 4/27/18.
//  Copyright © 2018 CSU. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    var product: Product? {
        didSet {
            guard let unwrappedProduct = product else {
                return
            }
            self.iconImageView?.image = UIImage(named: unwrappedProduct.imageName)
            self.titleLabel?.text = unwrappedProduct.title
            self.priceLabel?.text = "\(unwrappedProduct.price) ₽";
        }
    }
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
