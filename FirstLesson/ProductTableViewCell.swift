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
            setImage(product: unwrappedProduct)
            
        }
    }
    
    func setImage(product: Product)
    {
//        self.iconImageView?.image = UIImage(named: product.imageName)
        self.titleLabel?.text = product.title
        self.priceLabel?.text = "\(product.price) ₽";
    }
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
