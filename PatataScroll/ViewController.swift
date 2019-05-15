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
    @IBOutlet weak var scrollIsidro: UIScrollView!
    
    @IBOutlet weak var contentViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewLeadingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
        updateConstraintsForSize(scrollIsidro.bounds.size)
    }

}

// Funciones para controlar el scroll
extension ViewController: UIScrollViewDelegate {
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        debugPrint("La vista va a cambiar de layout")
        let widthScale = size.width / imgIsidrio.bounds.width
        let heightScale = size.height / imgIsidrio.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollIsidro.minimumZoomScale = minScale
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgIsidrio
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        debugPrint("scrolleando \(scrollView.contentOffset)")
        updateConstraintsForSize(scrollIsidro.bounds.size)
    }
    
    func updateConstraintsForSize(_ size: CGSize) {
        let xOffset = max(0, (size.width - imgIsidrio.frame.width) / 2)
        contentViewLeadingConstraint.constant = xOffset
        contentViewTrailingConstraint.constant = xOffset

        let yOffset = max(0, (size.height - imgIsidrio.frame.height) / 2)
        contentViewTopConstraint.constant = yOffset
        contentViewBottomConstraint.constant = yOffset
        
        view.layoutIfNeeded()
    }

}
