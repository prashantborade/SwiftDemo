//
//  CustomHeroCollectionView.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 6/4/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit




class CustomHeroCollectionView: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{

    //var heros: [Hero] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    var iconArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 1...32 {
            
             print("icon\(index)!")
            
            self.iconArray.append(("icon\(index)"))
            
            DispatchQueue.main.async {
                
                self.collectionView.reloadData()
            }
        }
       
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.iconArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCustomCell", for: indexPath) as! HeroCustomCell
        
        cell.imageIcon.image = UIImage(named:iconArray[indexPath.row])
        cell.imageIcon.contentMode = .scaleAspectFill
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let yourWidth = collectionView.bounds.width/5.0
        let yourHeight = yourWidth
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    
   
    

}
