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
        self.delegate = self
        
        if let firstViewController = createPersonViewController() {
            self.setViewControllers([firstViewController],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
        }
    }
    
    func createPersonViewController() -> PersonViewController? {
        if !(0 ..< nombresCaras.count).contains(pageIndex){
            return nil
        }
        let firstName = nombresCaras[pageIndex]
        
        if let personViewController = self.storyboard?.instantiateViewController(withIdentifier: "PersonViewController") as? PersonViewController {
            personViewController.personName = firstName
            personViewController.indexPosition = pageIndex
            return personViewController
        } else {
            return nil
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return nombresCaras.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pageIndex
    }
}

extension PeoplePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewController = viewController as? PersonViewController,
            currentViewController.indexPosition > 0 else  {
                return nil
        }
        
        pageIndex = currentViewController.indexPosition - 1
        debugPrint("PageIndex vale \(pageIndex)")
        return createPersonViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewController = viewController as? PersonViewController,
            currentViewController.indexPosition < nombresCaras.count else  {
                return nil
        }
        
        pageIndex = currentViewController.indexPosition + 1
        debugPrint("PageIndex vale \(pageIndex)")
//        if let personAfterViewController = createPersonViewController() {
//            return personAfterViewController
//        }
//        return nil
        // Lo anterior comentado es equivalente a esto:
        return createPersonViewController()
    }
    
}


extension PeoplePageViewController: UIPageViewControllerDelegate {
   
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        debugPrint("Finish animating \(finished) page \(pageIndex) \(completed) previous \(previousViewControllers.count)")
    }
}
