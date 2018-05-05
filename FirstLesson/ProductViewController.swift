//
//  ProductViewController.swift
//  FirstLesson
//
//  Created by alexey on 4/21/18.
//  Copyright © 2018 CSU. All rights reserved.
//

import UIKit

struct Product {
    let images   : [String]
    let title       : String
    let price       : Float
}

class ProductViewController: UIViewController {
    @IBOutlet var galleryView: GalleryView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    public var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        loadProduct()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func actionBuy(_ sender: UIButton) {
        
    }
    
    func setupViewController() {
        if product == nil {
            product = Product(images: ["https://files.brightside.me/files/news/part_42/426960/18434910-Depositphotos_96023798_xl-2015-1513595556-650-47344d3213-1514622501.jpg",
                                       "https://files.brightside.me/files/news/part_42/426960/18434910-Depositphotos_96023798_xl-2015-1513595556-650-47344d3213-1514622501.jpg",
                                       "https://files.brightside.me/files/news/part_42/426960/18434910-Depositphotos_96023798_xl-2015-1513595556-650-47344d3213-1514622501.jpg"],
                              title: "iPhone 6S Rose Gold 64GB почти новый все чеки",
                              price: 18500)
        }
    }

    func loadProduct() {
        guard let product = product else {
            print("<ProductViewController: loadProduct> ERROR product is nil!!!")
            return
        }
        
        title = product.title
        galleryView.loadUrls(urls: product.images)
        titleLabel.text = product.title
        priceLabel.text = "\(product.price) ₽"
    }
    
}
