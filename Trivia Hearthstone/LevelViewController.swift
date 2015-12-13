//
//  LevelViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/11/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit
import CoreData

class LevelViewController: UIViewController {
    
    let moc = DataController().managedObjectContext

    @IBOutlet var goldLabel: UILabel!
    
    @IBAction func store(sender: AnyObject) {
        openStore()
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
    }
    
    
    @IBOutlet var storeView: UIView!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var backLabel: UIButton!
    @IBOutlet var storeLabel: UIButton!
    
    @IBOutlet var locked: [UIImageView]!
    @IBOutlet var goldArray: [UIImageView]!
    @IBOutlet var label100: [UILabel]!
    @IBOutlet var levels: [UIButton]!
    
    
    
    func openStore(){
        
        scrollView.userInteractionEnabled = false
        storeView.hidden = false
        backLabel.enabled = false
        storeLabel.enabled = false
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 1500
        checkdata()


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkdata() {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            goldLabel.text = String(fetchedUser.first!.gold!)
    
            
            if(fetchedUser.first!.unlocked2 == true) {
                locked[0].hidden = true
                goldArray[0].hidden = true
                label100[0].hidden = true
                levels[0].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked3 == true) {
                locked[1].hidden = true
                goldArray[1].hidden = true
                label100[1].hidden = true
                levels[1].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked4 == true) {
                locked[2].hidden = true
                goldArray[2].hidden = true
                label100[2].hidden = true
                levels[2].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked5 == true) {
                locked[3].hidden = true
                goldArray[3].hidden = true
                label100[3].hidden = true
                levels[3].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked6 == true) {
                locked[4].hidden = true
                goldArray[4].hidden = true
                label100[4].hidden = true
                levels[4].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked7 == true) {
                locked[5].hidden = true
                goldArray[5].hidden = true
                label100[5].hidden = true
                levels[5].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked8 == true) {
                locked[6].hidden = true
                goldArray[6].hidden = true
                label100[6].hidden = true
                levels[6].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked9 == true) {
                locked[7].hidden = true
                goldArray[7].hidden = true
                label100[7].hidden = true
                levels[7].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked10 == true) {
                locked[8].hidden = true
                goldArray[8].hidden = true
                label100[8].hidden = true
                levels[8].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked11 == true) {
                locked[9].hidden = true
                goldArray[9].hidden = true
                label100[9].hidden = true
                levels[9].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked12 == true) {
                locked[10].hidden = true
                goldArray[10].hidden = true
                label100[10].hidden = true
                levels[10].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked13 == true) {
                locked[11].hidden = true
                goldArray[11].hidden = true
                label100[11].hidden = true
                levels[11].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked14 == true) {
                locked[12].hidden = true
                goldArray[12].hidden = true
                label100[12].hidden = true
                levels[12].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked15 == true) {
                locked[13].hidden = true
                goldArray[13].hidden = true
                label100[13].hidden = true
                levels[13].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked16 == true) {
                locked[14].hidden = true
                goldArray[14].hidden = true
                label100[14].hidden = true
                levels[14].alpha = 1
            }
            
            if(fetchedUser.first!.unlocked17 == true) {
                locked[15].hidden = true
                goldArray[15].hidden = true
                label100[15].hidden = true
                levels[15].alpha = 1
            }
            
        } catch {
            fatalError("Core Data Error")
        }
    
    }
}












