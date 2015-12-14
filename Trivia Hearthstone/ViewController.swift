//
//  ViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/3/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit
import CoreData
import MessageUI



let moc = DataController().managedObjectContext


class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func feedbackButton(sender: AnyObject) {
        if (MFMailComposeViewController.canSendMail()) {
            
            let emailTitle = "Trivia & Quiz Hearthstone Feedback"
            let toRecipients = ["kokatooentertainment@gmail.com"]
            
            let mc : MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            mc.setToRecipients(toRecipients)
            
            self.presentViewController(mc, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        

        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if((fetchedUser.first?.initialized) == nil){

                initializeUser()
            }
            
        } catch {
            fatalError("Core Data Error")
        }
        

        
        

    }
    
    func initializeUser() {
        let entity = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: moc) as! User
        
        entity.setValue(true, forKey: "initialized")
        entity.setValue(2000, forKey:  "gold")
        entity.setValue(false, forKey: "rated")
        entity.setValue(false, forKey: "removeads")
        entity.setValue(false, forKey: "unlocked2")
        entity.setValue(false, forKey: "unlocked3")
        entity.setValue(false, forKey: "unlocked4")
        entity.setValue(false, forKey: "unlocked5")
        entity.setValue(false, forKey: "unlocked6")
        entity.setValue(false, forKey: "unlocked7")
        entity.setValue(false, forKey: "unlocked8")
        entity.setValue(false, forKey: "unlocked9")
        entity.setValue(false, forKey: "unlocked10")
        entity.setValue(false, forKey: "unlocked11")
        entity.setValue(false, forKey: "unlocked12")
        entity.setValue(false, forKey: "unlocked13")
        entity.setValue(false, forKey: "unlocked14")
        entity.setValue(false, forKey: "unlocked15")
        entity.setValue(false, forKey: "unlocked16")
        entity.setValue(false, forKey: "unlocked17")

        
        do {
            try moc.save()
        } catch {
            fatalError("Save failed to core data")
        }

    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
            
        case MFMailComposeResultCancelled.rawValue:
            print("Mail Cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail Saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail Failed")
        default:
            break
            
        }
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

