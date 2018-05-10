//
//  GalleryView.swift
//  FirstLesson
//
//  Created by alexey on 5/5/18.
//  Copyright © 2018 CSU. All rights reserved.
//

import UIKit
import AlamofireImage

class GalleryView: UIView {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControll: UIPageControl!
    
    var urls: [URL?] = []
    
    public func loadUrls(urls links: [String]) {
        urls = links.map { URL(string: $0) } //.filter { ($0 != nil) }
        
        reloadImages()
    }
    
    public func reloadImages() {
        var x = CGFloat(0)
        let width = scrollView.frame.size.width
        
        for url in urls {
            guard let url = url else {
                continue
            }
            
            var imageView = UIImageView(frame: CGRect(x: x, y: 0, width: width, height: scrollView.frame.size.height))
            imageView.contentMode = .scaleAspectFit
//            imageView.af_setImage(withURL: url)
            
            scrollView.addSubview(imageView)
            
            x += width
        }
        
        pageControll.numberOfPages = Int(x / width)
        scrollView.contentSize = CGSize(width: x, height: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension GalleryView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x / scrollView.frame.size.width
        let index = Int(floor(x - 0.5)) + 1
//        let offset = (scrollView.contentOffset.x - CGFloat(index) * scrollView.frame.size.width) / scrollView.frame.size.width
//
//        print("o: \(offset)")
        
        pageControll.currentPage = index
    }
}
