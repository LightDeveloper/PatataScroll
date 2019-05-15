//
//  ViewController.swift
//  PatataScroll
//
//  Created by Dev2 on 15/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgIsidrio: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Movidas chungas con delegados....
        
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        debugPrint("scrolleando \(scrollView.contentOffset)")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgIsidrio
    }

}
