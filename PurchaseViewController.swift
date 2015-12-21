//
//  PurchaseViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/11/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit
import Parse
import CoreData


class PurchaseViewController: UIViewController {
    
    
    
    @IBAction func exitButton(sender: AnyObject) {
        
        let parentVC = self.parentViewController as! LevelViewController
        parentVC.storeView.hidden = true
        parentVC.scrollView.userInteractionEnabled = true
        parentVC.backLabel.enabled = true
        parentVC.storeLabel.enabled = true
    }
    
    @IBAction func rateButton(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if (fetchedUser.first!.rated == false){
                
                UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(1068367208)&onlyLatestVersion=true&pageNumber=0&sortOrdering=1)")!);
                
                let currentgold = Int(fetchedUser.first!.gold!)
                fetchedUser.first!.setValue(currentgold + 100, forKey: "gold")
                fetchedUser.first!.setValue(true, forKey: "rated")
                
                
                do {
                    try moc.save()
                } catch {
                    fatalError("Save failed to core data")
                }
                
                 let parentVC = self.parentViewController as! LevelViewController
                 parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
                
            }
            
            else {
                
                let alert = UIAlertController(title: "Failed", message: "You have already rated.",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
        

    }
    
    
    @IBAction func watchAds(sender: AnyObject) {
        // Show rewarded video pre-roll message and video ad at location MainMenu. See Chartboost.h for available location options.
        Chartboost.showRewardedVideo(CBLocationMainMenu)
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            let currentgold = Int(fetchedUser.first!.gold!)
            fetchedUser.first!.setValue(currentgold + 50, forKey: "gold")
            
            do {
                try moc.save()
            
            
            } catch {
                fatalError("Save failed to core data")
            }
            
            let parentVC = self.parentViewController as! LevelViewController
            parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    
    @IBAction func oneDollar(sender: AnyObject) {
        
        
        PFPurchase.buyProduct("300gold") {
            (error: NSError?) -> Void in
            if error == nil {
                
                let parentVC = self.parentViewController as! LevelViewController
                
                let userFetch = NSFetchRequest(entityName: "User")
                
                do{
                    let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
                    
                    parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
                    
                    
                } catch {
                    fatalError("Core Data Error")
                }
                
            }
            
            else {
                let alert = UIAlertController(title: "Error", message: "Failed to purchase.",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        


    }
    
    @IBAction func twoDollar(sender: AnyObject) {
        
        
        PFPurchase.buyProduct("700gold") {
            (error: NSError?) -> Void in
            if error == nil {
                
                let parentVC = self.parentViewController as! LevelViewController
                
                let userFetch = NSFetchRequest(entityName: "User")
                
                do{
                    let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
                    
                    parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
                    
                    
                } catch {
                    fatalError("Core Data Error")
                }

                
            }
            else{
                let alert = UIAlertController(title: "Error", message: "Failed to purchase.",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
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
