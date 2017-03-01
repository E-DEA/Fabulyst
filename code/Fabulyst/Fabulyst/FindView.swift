//
//  File.swift
//  Fabulyst
//
//  Created by Vishnu M on 13/11/16.
//  Copyright © 2016 Vishnu M. All rights reserved.
//

import Foundation
import UIKit

class FindView: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate
{
    
    @IBAction func unwindToFindView(segue: UIStoryboardSegue) {
    }
    
    var Fdata = ["FOREVER 21 Women Beige Printed Cold Shoulder Crop Top", "FOREVER 21 Cream-Coloured Lace Flared Skirt", "FOREVER 21 Women Burgundy Checked Longline Casual Shirt", "FOREVER 21 Women Olive Green Solid Sheath Dress", "FOREVER 21 Women Black Printed Crop Top", "FOREVER 21 Black Sleeveless Puffer Jacket"]
    var Fcost = ["Rs. 1539", "Rs. 1679", "Rs. 1259", "Rs. 2039", "Rs. 1119", "Rs. 1119"]
    var Foff = ["10% off", "20% off", "32% off", "7% off", "10% off", "15% off"]
    var FMdata = ["Western",
                  "Tops",
                  "Bottom Wear",
                  "Winter wear",
                  "Ethnic",
                  "Skirts"
                ]
    var IURL = [    "https://s3-ap-southeast-1.amazonaws.com/fabpro/11475127365495-FOREVER-21-Women-Beige-Printed-Crop-Top-9331475127365152-1-147916218226.jpg",
                "https://s3-ap-southeast-1.amazonaws.com/fabpro/11477127622749-FOREVER-21-Women-Skirts-3241477127622477-1-147916210612.jpg",
                "https://s3-ap-southeast-1.amazonaws.com/fabpro/11476523282061-FOREVER-21-Women-Burgundy-Regular-Fit-Checked-Casual-Shirt-1371476523281875-1-147916200302.jpg",
                "https://s3-ap-southeast-1.amazonaws.com/fabpro/11478758728602-FOREVER-21-Women-Olive-Solid-Sheath-Dress-7441478758728336-1-14791616794.jpg",
                "https://s3-ap-southeast-1.amazonaws.com/fabpro/11472549671464-FOREVER-21-Women-Black-Printed-Crop-Top-8761472549671178-1-147916152875.jpg",
                "https://s3-ap-southeast-1.amazonaws.com/fabpro/11475306390300-FOREVER-21-Black-Sleeveless-Puffer-Jacket-5601475306390060-1-147916141489.jpg"
                ]
//    "https://s3-ap-southeast-1.amazonaws.com/fabpro/11475127365495-FOREVER-21-Women-Beige-Printed-Crop-Top-9331475127365152-1-147916218226.jpg"
    var MURL = [ "https://dresses.com.pk/wp-content/uploads/2016/04/dresses-for-women.png",
                 "https://cdn0.iconfinder.com/data/icons/clothes-3-4/512/114-256.png",
                 "https://cdn4.iconfinder.com/data/icons/fashion-and-clothing/128/Clothes_Trousers-512.png",
                 "https://cdn1.iconfinder.com/data/icons/solidix-clothing-and-fashion/128/fashion_clothing_garment-20-512.png",
                 "https://cdn0.iconfinder.com/data/icons/huge-basic-icons-part-3/512/Dress.png",
                 "https://cdn2.iconfinder.com/data/icons/glyphie-1/40/skirt_dress_cloth_clothing_fashion_costume-512.png"
                ]
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var VerticalCollectionView: UICollectionView!
    @IBOutlet var HorizontalCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView == self.VerticalCollectionView {
            let cellA = collectionView.dequeueReusableCellWithReuseIdentifier("Findcell", forIndexPath: indexPath) as! FindCell
            cellA.FindDesc.text = Fdata[indexPath.item]
            cellA.FindCost.text = Fcost[indexPath.item]
            cellA.FindOff.text = Foff[indexPath.item]
            if let url = NSURL(string: IURL[indexPath.item]) {
                if let data = NSData(contentsOfURL: url) {
                    cellA.FindImage.image = UIImage(data: data)
                }
            }


            return cellA
            
        }
        
        else {
            let cellB = collectionView.dequeueReusableCellWithReuseIdentifier("FindMenucell", forIndexPath: indexPath) as! FindMenuCell
            
            if let url = NSURL(string: MURL[indexPath.item]) {
                if let data = NSData(contentsOfURL: url) {
                    cellB.FMImage.image = UIImage(data: data)
                }
            }
            
            cellB.FMText.text = FMdata[indexPath.item]
            
            return cellB
            
        }
        
         let token = FBSDKAccessToken.currentAccessToken()
        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Findcell", forIndexPath: indexPath) as! FindCell
        
//        cell.FindDesc.text = Fdata[indexPath.item]
//        cell.FindCost.text = Fcost[indexPath.item]
//        cell.FindOff.text = Foff[indexPath.item]

//        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.VerticalCollectionView {
            return Fdata.count
        }
        return FMdata.count
    }
}

class FindCell : UICollectionViewCell
{
    @IBOutlet var FindImage: UIImageView!
    @IBOutlet var FindDesc: UILabel!
    @IBOutlet var FindCost: UILabel!
    @IBOutlet var FindOff: UILabel!
}

class FindMenuCell : UICollectionViewCell
{
    @IBOutlet var FMImage: UIImageView!
    @IBOutlet var FMText: UILabel!
}
