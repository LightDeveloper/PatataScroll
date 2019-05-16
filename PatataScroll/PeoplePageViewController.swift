//
//  CatsPageViewController.swift
//  PatataScroll
//
//  Created by Dev2 on 15/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class PeoplePageViewController: UIPageViewController {
    
    let nombresCaras = ["Isidro", "Brian", "Jennifer", "Ruperta"]
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        let firstName = nombresCaras[pageIndex]
        if let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "PersonViewController") as? PersonViewController {

            firstViewController.personName = firstName
            
            self.setViewControllers([firstViewController],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
        }
    }
    
}

extension PeoplePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        return nil
        
    }
    
    
    
}
