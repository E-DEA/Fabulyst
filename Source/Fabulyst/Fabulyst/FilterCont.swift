//
//  FilterCont.swift
//  Fabulyst
//
//  Created by Vishnu M on 15/11/16.
//  Copyright © 2016 Vishnu M. All rights reserved.
//

import Foundation
import UIKit

class FilterCont: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    let data = ["Tokyo Talkies Navy & White Floral Print Polyester A-Line Dress",
                "Harpa Navy Floral Print Georgette A-Line Dress",
                "Eavan Black Lace Fit & Flare Dress",
                "Oxolloxo Multicoloured Printed Fit & Flare Dress",
                "Moda Rapido Women Brown & Off-White Printed A-line Dress",
                "Ruhaans Blue Printed A-Line Dress"
                ]
    let cost = ["Rs. 624", "Rs. 799", "Rs. 1019", "Rs. 1195", "Rs. 699", "Rs. 1079"]
    let IURL = ["https://assets.myntassets.com/w_480,q_90/assets/images/1370030/2016/6/18/11466227777623-Tokyo-Talkies-Women-Dresses-5771466227777499-2.jpg",
                "https://assets.myntassets.com/w_480,q_90/assets/images/1442975/2016/7/22/11469170986266-Harpa-Navy-Floral-Print-Georgette-A-Line-Dress-3701469170986400-1.jpg",
                "https://assets.myntassets.com/w_480,q_90/assets/images/252600/2015/11/26/11448517052210-Eavan-Black-Lace-Fit--Flare-Dress-5031448517051853-1.jpg",
                "https://assets.myntassets.com/w_1080,q_90/v1/images/style/properties/Oxolloxo-Women-Dresses_f9958b885a645a9d42daeecb41d674ff_images.jpg",
                "https://assets.myntassets.com/w_480,q_90/assets/images/1578281/2016/10/26/11477464511042-Moda-Rapido-Women-Dresses-6081477464510806-1.jpg",
                "https://assets.myntassets.com/w_480,q_90/v1/image/style/properties/852963/Ruhaans-Blue-Printed-Fit--Flare-Dress_1_1b00b549a78eb8faa909bcbd4071cffe.jpg"
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Filtercell", forIndexPath: indexPath) as! FilterCell
        
        if let url = NSURL(string: IURL[indexPath.item]) {
            if let data = NSData(contentsOfURL: url) {
                cell.FilterImage.image = UIImage(data: data)
            }
        }
        
        cell.FilterCost.text = cost[indexPath.item]
        cell.FilterText.text = data[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return IURL.count
    }


}

class FilterCell : UICollectionViewCell {
    
    @IBOutlet var FilterImage: UIImageView!
    @IBOutlet var FilterText: UILabel!
    @IBOutlet var FilterCost: UILabel!
}
