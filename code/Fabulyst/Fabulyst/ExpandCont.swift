//
//  ExpandCont.swift
//  Fabulyst
//
//  Created by Vishnu M on 15/11/16.
//  Copyright © 2016 Vishnu M. All rights reserved.
//

import Foundation
import UIKit

class ExpandCont: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var CloseButton: UIButton!
    
    
    let data = ["1","2","3"]
    let URLar = ["https://s3-ap-southeast-1.amazonaws.com/fabpro/11474709730318-Marks--Spencer-Women----Top-1101474709730044-2-147682299453.jpg",
                 "https://s3-ap-southeast-1.amazonaws.com/fabpro/11474709730293-Marks--Spencer-Women----Top-1101474709730044-3-147682299856.jpg",
                 "https://s3-ap-southeast-1.amazonaws.com/fabpro/11474709730242-Marks--Spencer-Women----Top-1101474709730044-5-147682300791.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Expandcell", forIndexPath: indexPath) as! ExpandCell
        
         if let url = NSURL(string: URLar[indexPath.item]) {
            if let data = NSData(contentsOfURL: url) {
                cell.ExpImage.image = UIImage(data: data)
            }
        }
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
}

class ExpandCell : UICollectionViewCell
{
    @IBOutlet var ExpImage: UIImageView!
}
