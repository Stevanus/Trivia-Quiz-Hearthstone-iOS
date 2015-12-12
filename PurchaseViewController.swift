//
//  PurchaseViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/11/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    
    
    @IBAction func exitButton(sender: AnyObject) {
        
        let parentVC = self.parentViewController as! LevelViewController
        parentVC.storeView.hidden = true
        parentVC.scrollView.userInteractionEnabled = true
        parentVC.backLabel.enabled = true
        parentVC.storeLabel.enabled = true
    }
    
    @IBAction func rateButton(sender: AnyObject) {
        
    }
    
    
    @IBAction func oneDollar(sender: AnyObject) {
    }
    
    @IBAction func twoDollar(sender: AnyObject) {
    }
    
    @IBAction func fourDollar(sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
        
    }


}
