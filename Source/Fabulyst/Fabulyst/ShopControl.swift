//
//  ShopControl.swift
//  Fabulyst
//
//  Created by Vishnu M on 15/11/16.
//  Copyright © 2016 Vishnu M. All rights reserved.
//

import Foundation
import UIKit

class ShopControl : UIViewController{
    @IBOutlet weak var CloseButton: UIButton!
    @IBOutlet weak var BuyButton: UIButton!
    @IBOutlet weak var IMage: UIImageView!
    
    
//    UIApplication.sharedApplication().openURL(NSURL(string: "http://www.google.com")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: "https://s3-ap-southeast-1.amazonaws.com/fabpro/11474709730318-Marks--Spencer-Women----Top-1101474709730044-2-147682299453.jpg") {
            if let data = NSData(contentsOfURL: url) {
                IMage.image = UIImage(data: data)
            }
        }        
    }
    
    @IBAction func didTapGoogle(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.myntra.com/tops/marks--spencer/marks--spencer-women-navy-blue-solid-cold-shoulder-top/1510901/buy")!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

class ShopControl2 : UIViewController{
    
    @IBOutlet var DImage: UIImageView!
    
    //    UIApplication.sharedApplication().openURL(NSURL(string: "http://www.google.com")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: "https://s3-ap-southeast-1.amazonaws.com/fabpro/11472549671464-FOREVER-21-Women-Black-Printed-Crop-Top-8761472549671178-1-147916152875.jpg") {
            if let data = NSData(contentsOfURL: url) {
                DImage.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func didTapPurchase(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.myntra.com/tops/forever-21/forever-21-women-black-printed-crop-top/1450703/buy")!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
