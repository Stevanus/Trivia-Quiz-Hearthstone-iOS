//
//  GameOverViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/5/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit
import Social

class GameOverViewController: UIViewController {

    
    @IBAction func mainmenubutton(sender: AnyObject) {
 
    }
    
    
    @IBAction func sharescore(sender: AnyObject) {
        var sharescore : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        sharescore.setInitialText("I scored 25  on Trivia & Quiz Hearthstone!")
        
        self.presentViewController(sharescore, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }


}
