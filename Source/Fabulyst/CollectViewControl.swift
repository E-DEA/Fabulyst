//
//  View2.swift
//  Fabulyst
//
//  Created by Vishnu M on 27/09/16.
//  Copyright © 2016 Vishnu M. All rights reserved.
//

import Foundation
import UIKit


class CollectViewControl: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var menuButton: UIBarButtonItem!
    let token = FBSDKAccessToken.currentAccessToken()
    var data = ["Marks & Spencer Women Navy Blue Solid Cold-Shoulder Top", "KOOVS Cropped Pleat Front Trousers", "United Colors of Benetton Women Blue Regular Fit Mid-Rise Clean Look Jeans"]
    var cost = ["Rs. 2499", "Rs. 1295", "Rs. 2599"]
    var tags = ["#daywear #dressyday #unconventional #smart #modern", "#semiformal #casual #simplistic #conventional #modern","#casual #comfort #unconventional #smart"]
    var IURL = [ "https://s3-ap-southeast-1.amazonaws.com/fabpro/11474709730334-Marks--Spencer-Women----Top-1101474709730044-1-147682298977.jpg",
                 "https://s3-ap-southeast-1.amazonaws.com/fabpro/81810-40561b85b6b0d2a75b7f08ff56d7dfaa-image1-default-147898242133.jpg",
                 "https://s3-ap-southeast-1.amazonaws.com/fabpro/11470115391363-United-Colors-of-Benetton-Women-Jeans-31470115391129-1-14782367874.jpg"]

    @IBAction func unwindToCollectViewControl(segue: UIStoryboardSegue) {
    }
    
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
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Handpickedcell", forIndexPath: indexPath) as! HandpickedCell
        
        cell.HandpickedText.text = data[indexPath.item]
        cell.HandpickedCost.text = cost[indexPath.item]
        cell.HandpickedTags.text = tags[indexPath.item]
        if let url = NSURL(string: IURL[indexPath.item]) {
            if let data = NSData(contentsOfURL: url) {
                cell.HandpickedImage.image = UIImage(data: data)
            }
        }
        
        return cell
    
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return data.count
    }
}

class HandpickedCell : UICollectionViewCell
{
    @IBOutlet var HandpickedImage: UIImageView!
    @IBOutlet var HandpickedTags: UILabel!
    @IBOutlet var HandpickedCost: UILabel!
    @IBOutlet var HandpickedText: UILabel!
    
}

