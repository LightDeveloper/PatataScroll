//
//  ViewController.swift
//  PatataScroll
//
//  Created by Dev2 on 15/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    var personName: String?
    var indexPosition = 0
    
    @IBOutlet weak var imgPerson: UIImageView!
    @IBOutlet weak var scrollPerson: UIScrollView!
    
    @IBOutlet weak var contentViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewLeadingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let personNameUnwrapped = personName,
            let personImage = UIImage(named: personNameUnwrapped) {
            imgPerson.image = personImage
        } else {
            imgPerson.backgroundColor = .red
        }
            }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
        updateConstraintsForSize(scrollPerson.bounds.size)
        
        scrollPerson.setZoomScale(0.01, animated: false)
    }

}

// Funciones para controlar el scroll
extension PersonViewController: UIScrollViewDelegate {
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
//        debugPrint("La vista va a cambiar de layout")
        let widthScale = size.width / imgPerson.bounds.width
        let heightScale = size.height / imgPerson.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollPerson.minimumZoomScale = minScale
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgPerson
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        debugPrint("scrolleando \(scrollView.contentOffset)")
        updateConstraintsForSize(scrollPerson.bounds.size)
    }
    
    func updateConstraintsForSize(_ size: CGSize) {
        let xOffset = max(0, (size.width - imgPerson.frame.width) / 2)
        contentViewLeadingConstraint.constant = xOffset
        contentViewTrailingConstraint.constant = xOffset

        let yOffset = max(0, (size.height - imgPerson.frame.height) / 2)
        contentViewTopConstraint.constant = yOffset
        contentViewBottomConstraint.constant = yOffset
        
        view.layoutIfNeeded()
    }

}
