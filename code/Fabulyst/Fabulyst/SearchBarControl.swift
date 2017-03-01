//
//  Searchbarcontrol.swift
//  Fabulyst
//
//  Created by Vishnu M on 14/11/16.
//  Copyright © 2016 Vishnu M. All rights reserved.
//

import Foundation
import UIKit

class  SearchBarControl : UIViewController
{
    @IBOutlet weak var menuButton: UIBarButtonItem!
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
    
    
    

}
