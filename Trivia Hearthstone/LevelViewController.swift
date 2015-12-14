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
    

    
    @IBOutlet var storeView: UIView!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var backLabel: UIButton!
    @IBOutlet var storeLabel: UIButton!
    
    @IBOutlet var locked: [UIImageView]!
    @IBOutlet var goldArray: [UIImageView]!
    @IBOutlet var label100: [UILabel]!
    @IBOutlet var levels: [UIButton]!
    var levelchosen = 0
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func store(sender: AnyObject) {
        openStore()
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "questionchosen"){
            let Dest : TriviaViewController = segue.destinationViewController as! TriviaViewController
            Dest.questionchosen = levelchosen
        }
    }
    
    
    func levelfunction(levelnumber: Int){
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            let unlockedlevel = "unlocked\(levelnumber)"
            
            if(fetchedUser.first!.valueForKey(unlockedlevel) as! Bool == true) {
                levelchosen = levelnumber
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    
                    let currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    fetchedUser.first!.setValue(true, forKey: unlockedlevel)
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                }
            }
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    
    @IBAction func level1(sender: AnyObject) {
        levelchosen = 1
        performSegueWithIdentifier("questionchosen", sender: nil)
    }
    @IBAction func level2(sender: AnyObject) {
        levelfunction(2)
    }
    @IBAction func level3(sender: AnyObject) {
        levelfunction(3)
    }
    @IBAction func level4(sender: AnyObject) {
        levelfunction(4)
    }
    @IBAction func level5(sender: AnyObject) {
        levelfunction(5)
    }
    @IBAction func level6(sender: AnyObject) {
        levelfunction(6)
    }
    @IBAction func level7(sender: AnyObject) {
        levelfunction(7)
    }
    @IBAction func level8(sender: AnyObject) {
        levelfunction(8)
    }
    @IBAction func level9(sender: AnyObject) {
        levelfunction(9)
    }
    @IBAction func level10(sender: AnyObject) {
        levelfunction(10)
    }
    @IBAction func level11(sender: AnyObject) {
        levelfunction(11)
    }
    @IBAction func level12(sender: AnyObject) {
        levelfunction(12)
    }
    @IBAction func level13(sender: AnyObject) {
        levelfunction(13)
    }
    @IBAction func level14(sender: AnyObject) {
        levelfunction(14)
    }
    @IBAction func level15(sender: AnyObject) {
        levelfunction(15)
    }
    @IBAction func level16(sender: AnyObject) {
        levelfunction(16)
    }
    @IBAction func level17(sender: AnyObject) {
        levelfunction(17)
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
    
    func openStore(){
        
        scrollView.userInteractionEnabled = false
        storeView.hidden = false
        backLabel.enabled = false
        storeLabel.enabled = false
    }
    
    func checkdata() {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            //Display current gold
            goldLabel.text = String(fetchedUser.first!.gold!)
    
            //Check for which levels are already unlocked
            for index in 0...15 {
                
                //Checking unlocked level starts from 2, and ends at 17
                let unlockedlevel = "unlocked\(index+2)"
                
                if(fetchedUser.first!.valueForKey(unlockedlevel) as! Bool == true) {
                    locked[index].hidden = true
                    goldArray[index].hidden = true
                    label100[index].hidden = true
                    levels[index].alpha = 1
                }
                
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    
    }
}












