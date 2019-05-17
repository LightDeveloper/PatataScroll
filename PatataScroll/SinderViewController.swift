//
//  SinderViewController.swift
//  PatataScroll
//
//  Created by Dev2 on 17/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class SinderViewController: UIViewController {
    
    @IBOutlet weak var collectionPeople: UICollectionView!
    
    let peopleNames = ["Jennifer", "Ruperta", "Brian", "Isidro", "Sandra", "Mario", "Oscar", "Alvaro", "Sofia", "Ingrid", "Francisco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionPeople.dataSource = self
        collectionPeople.delegate = self
    }
}

extension SinderViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peopleNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdentifier = "AvatarCollectionViewCell"
        if let cell = collectionView.dequeueReusableCell( withReuseIdentifier: reuseIdentifier, for: indexPath) as? AvatarCollectionViewCell {
            
            cell.configure(name: peopleNames[indexPath.row], imageName: peopleNames[indexPath.row])
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension SinderViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("Se ha pulsado sobre section: \(indexPath.section) row \(indexPath.row)")
    }
    
}
