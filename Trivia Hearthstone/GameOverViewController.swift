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

    
    var questionchosen = Int()
    
    @IBAction func mainmenubutton(sender: AnyObject) {
 
    }
    
    
    @IBAction func sharescore(sender: AnyObject) {
        let sharescore : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        sharescore.addURL(NSURL(string: "itms-apps://itunes.apple.com/app/id1068367208"))
        
        self.presentViewController(sharescore, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "playagain"){
            let Dest : TriviaViewController = segue.destinationViewController as! TriviaViewController
            Dest.questionchosen = questionchosen
        }
    }


}
