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
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PeoplePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        return nil
        
    }
    
    
    
}
