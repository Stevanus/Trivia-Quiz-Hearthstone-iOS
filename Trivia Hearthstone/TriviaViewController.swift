//
//  TriviaViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/4/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit

struct Question {
    var question : String!
    var answers : [String]!
    var answer : Int!
}

class TriviaViewController: UIViewController {
    
    @IBOutlet var qLabel: UILabel!
    @IBOutlet var aButtons: [UIButton]!
    
    
    var questions = [Question]()
    
    var qNumber = Int() // Question Number
    var aNumber = Int() // Answer Number
    

    override func viewDidLoad() {
        super.viewDidLoad()

        questions =
        
        [Question(question: "What is the most amount of gold you can get in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 2),
        Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 1),
        Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 2),
        Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 0),
        Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
        Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3)]
        
        
        PickQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func PickQuestion(){
        
        if questions.count > 0 {
            qNumber = 0
            qLabel.text = questions[qNumber].question
            
            aNumber = questions[qNumber].answer
            
            for i in 0..<aButtons.count{
                aButtons[i].setTitle(questions[qNumber].answers[i], forState: UIControlState.Normal)
            }
            
            questions.removeAtIndex(qNumber)
            
            
        }
        
        else {
            print("Out of questions!")
            
        }
    }
    
    @IBAction func button1(sender: AnyObject) {
        if aNumber == 0{
            PickQuestion()
        }
        else{
            print("Wrong")
        }
    }
    
    @IBAction func button2(sender: AnyObject) {
        if aNumber == 1{
            PickQuestion()
        }
        else{
            print("Wrong")
        }
    }
    
    @IBAction func button3(sender: AnyObject) {
        if aNumber == 2{
            PickQuestion()
        }
        else{
            print("Wrong")
        }
    }
    
    @IBAction func button4(sender: AnyObject) {
        if aNumber == 3{
            PickQuestion()
        }
        else{
            print("Wrong")
        }
    }
    
    

}
