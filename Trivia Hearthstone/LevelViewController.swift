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
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            goldLabel.text = String(fetchedUser.first!.gold!)
            
        } catch {
            fatalError("Core Data Error")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
