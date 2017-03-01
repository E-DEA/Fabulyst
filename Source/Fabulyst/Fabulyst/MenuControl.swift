//
//  MenuControl.swift
//  Fabulyst
//
//  Created by Vishnu M on 15/11/16.
//  Copyright © 2016 Vishnu M. All rights reserved.
//

import Foundation
import UIKit

class MenuControl : UITableViewController {
    
    @IBOutlet weak var ProfImage: UIImageView!
    @IBOutlet weak var ProfName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ProfImage.layer.borderWidth = 1
        ProfImage.layer.masksToBounds = false
        ProfImage.layer.borderColor = UIColor.blackColor().CGColor
        ProfImage.layer.cornerRadius = ProfImage.frame.height/2
        ProfImage.clipsToBounds = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
