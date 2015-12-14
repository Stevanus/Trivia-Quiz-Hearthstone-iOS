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
    
    
    @IBAction func level1(sender: AnyObject) {
        levelchosen = 1
        performSegueWithIdentifier("questionchosen", sender: nil)
        
    }
    
    @IBAction func level2(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked2 == true) {
                levelchosen = 2
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked2")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
        
    }
    
    @IBAction func level3(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked3 == true) {
                levelchosen = 3
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked3")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }

                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level4(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked4 == true) {
                levelchosen = 4
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked4")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level5(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked5 == true) {
                levelchosen = 5
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked5")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level6(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked6 == true) {
                levelchosen = 6
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked6")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level7(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked7 == true) {
                levelchosen = 7
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked7")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level8(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked8 == true) {
                levelchosen = 8
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked8")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level9(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked9 == true) {
                levelchosen = 9
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked9")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level10(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked10 == true) {
                levelchosen = 10
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked10")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level11(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked11 == true) {
                levelchosen = 11
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked11")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level12(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked12 == true) {
                levelchosen = 12
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked12")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level13(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked13 == true) {
                levelchosen = 13
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked13")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level14(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked14 == true) {
                levelchosen = 14
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked14")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level15(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked15 == true) {
                levelchosen = 15
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked15")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }
    
    @IBAction func level16(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked16 == true) {
                levelchosen = 16
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked16")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
    }

    @IBAction func level17(sender: AnyObject) {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if(fetchedUser.first!.unlocked17 == true) {
                levelchosen = 17
                performSegueWithIdentifier("questionchosen", sender: nil)
            }
            else{
                if(Int(fetchedUser.first!.gold!) < 100){
                    openStore()
                }
                else{
                    var currentgold = Int(fetchedUser.first!.gold!)
                    fetchedUser.first!.setValue(currentgold - 100, forKey: "gold")
                    
                    fetchedUser.first!.setValue(true, forKey: "unlocked17")
                    
                    goldLabel.text = String(fetchedUser.first!.gold!)
                    checkdata()
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Save failed to core data")
                    }
                    
                }
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
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












