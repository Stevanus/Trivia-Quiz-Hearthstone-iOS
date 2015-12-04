//
//  ViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/3/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit

struct Question {
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
}

class ViewController: UIViewController {
    
    var Questions = [Question]()
    var QNumber = Int() // Question Number
    var ANumber = Int() // Answer Number
    
    @IBOutlet var header: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //header.font = UIFont(name: "Belwe-Medium", size 50)
        

        for family: String in UIFont.familyNames()
        {
            print("\(family)")
            for names: String in UIFont.fontNamesForFamilyName(family)
            {
                print("== \(names)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

