//
//  TinderViewController.swift
//  PatataScroll
//
//  Created by Dev2 on 16/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class TinderViewController: UIViewController {

    let peopleCount = 4

    @IBOutlet weak var pagePictures: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pagePictures.currentPage = 0
        pagePictures.numberOfPages = peopleCount
    }
}

extension TinderViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        debugPrint("El offset es \(scrollView.contentOffset) \(scrollView.frame.width)")
        
        let scrollWidth = scrollView.bounds.width
        let currentPage = Int( (scrollView.contentOffset.x + (scrollWidth * 0.5)) / scrollWidth)
        pagePictures.currentPage = currentPage
    }
}
