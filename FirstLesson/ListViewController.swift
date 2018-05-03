//
//  ListViewController.swift
//  FirstLesson
//
//  Created by alexey on 4/27/18.
//  Copyright © 2018 CSU. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []
    
    let cellIdentifier = "kCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        products = [
            Product(imageName: "image-product", title: "Product 0", price: 10000),
            Product(imageName: "image-product", title: "Product 1", price: 20000),
            Product(imageName: "image-product", title: "Product 2", price: 30000)
        ]
    }

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductTableViewCell

        cell?.product = products[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let productViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController else {
            return
        }

        let product = products[indexPath.row]

        productViewController.product = product

        self.navigationController?.pushViewController(productViewController, animated: true)
    }

}
