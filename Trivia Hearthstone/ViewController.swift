//
//  ViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/3/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit
import CoreData



let moc = DataController().managedObjectContext


class ViewController: UIViewController {
    

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if((fetchedUser.first?.initialized) == nil){
                
                print(1)
                initializeUser()
            }
            
            

        } catch {
            fatalError("Core Data Error")
        }
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if((fetchedUser.first!.gold) == 100){
                print("GOLD!")
            }
            
            print (fetchedUser.first!.gold)
            print (fetchedUser.first!.initialized)
            print (fetchedUser.first!.rated)
            
        } catch {
            fatalError("Core Data Error")
        }
        
        

    }
    
    func initializeUser() {
        let entity = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: moc) as! User
        
        entity.setValue(true, forKey: "initialized")
        entity.setValue(100, forKey:  "gold")
        entity.setValue(false, forKey: "rated")
        entity.setValue(false, forKey: "removeads")
        entity.setValue(false, forKey: "unlocked2")
        entity.setValue(false, forKey: "unlocked3")
        entity.setValue(false, forKey: "unlocked4")
        entity.setValue(false, forKey: "unlocked5")
        
        do {
            try moc.save()
        } catch {
            fatalError("Save failed to core data")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

