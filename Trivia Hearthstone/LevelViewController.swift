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
    
    func openStore(){
        
        scrollView.userInteractionEnabled = false
        storeView.hidden = false
        backLabel.enabled = false
        storeLabel.enabled = false
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 1500

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
    
    
    



}
