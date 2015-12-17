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
        
        UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(1068367208)&onlyLatestVersion=true&pageNumber=0&sortOrdering=1)")!);
        
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            let currentgold = Int(fetchedUser.first!.gold!)
            fetchedUser.first!.setValue(currentgold + 100, forKey: "gold")
            fetchedUser.first!.setValue(true, forKey: "removeads")
            
            
            do {
                try moc.save()
            } catch {
                fatalError("Save failed to core data")
            }
            
            
            
        } catch {
            fatalError("Core Data Error")
        }
        
        
        let parentVC = self.parentViewController as! LevelViewController
        
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
            
            
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
            fetchedUser.first!.setValue(true, forKey: "removeads")
            
            
            do {
                try moc.save()
            } catch {
                fatalError("Save failed to core data")
            }
            
            
            
        } catch {
            fatalError("Core Data Error")
        }

        
        let parentVC = self.parentViewController as! LevelViewController
        
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
            
            
        } catch {
            fatalError("Core Data Error")
        }
        
    }
    
    
    @IBAction func oneDollar(sender: AnyObject) {
        
        
        PFPurchase.buyProduct("300gold") {
            (error: NSError?) -> Void in
            if error == nil {
                // Run UI logic that informs user the product has been purchased, such as displaying an alert view.
                let alert = UIAlertController(title: "Success!", message: "300 gold has been added to your account.",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
            else {
                print("error")
            }
        }
        
        let parentVC = self.parentViewController as! LevelViewController
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
            
            
        } catch {
            fatalError("Core Data Error")
        }

    }
    
    @IBAction func twoDollar(sender: AnyObject) {
        
        
        PFPurchase.buyProduct("700gold") {
            (error: NSError?) -> Void in
            if error == nil {
                // Run UI logic that informs user the product has been purchased, such as displaying an alert view.
                let alert = UIAlertController(title: "Success!", message: "700 gold has been added to your account.",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)

                
            }
        }
        
        let parentVC = self.parentViewController as! LevelViewController
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
            
            
        } catch {
            fatalError("Core Data Error")
        }

        
        
    }
    
    @IBAction func fourDollar(sender: AnyObject) {
        
        
        
        PFPurchase.buyProduct("1500gold") {
            (error: NSError?) -> Void in
            if error == nil {
                // Run UI logic that informs user the product has been purchased, such as displaying an alert view.
                let alert = UIAlertController(title: "Success!", message: "1500 gold has been added to your account.",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)

            }
        }
        
        let parentVC = self.parentViewController as! LevelViewController
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            parentVC.goldLabel.text = String(fetchedUser.first!.gold!)
            
            
        } catch {
            fatalError("Core Data Error")
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
