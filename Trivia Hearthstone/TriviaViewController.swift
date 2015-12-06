//
//  TriviaViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/4/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit
import AVFoundation

struct Question {
    var question : String!
    var answers : [String]!
    var answer : Int!
}

class TriviaViewController: UIViewController {
    
    var importcorrectSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("correct", ofType: "mp3")!)
    var correctSound = AVAudioPlayer()
    
    var importwrongSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrong", ofType: "mp3")!)
    var wrongSound = AVAudioPlayer()
    
    @IBOutlet var qLabel: UILabel!
    @IBOutlet var aButtons: [UIButton]!
    
    
    var questions = [Question]()
    
    var qNumber = Int() // Question Number
    var aNumber = Int() // Answer Number
    
    
    @IBOutlet var displayScore: UILabel!
    @IBOutlet var displayTimeLeft: UILabel!
    
    var score = 0
    var timer = 7

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            correctSound = try AVAudioPlayer(contentsOfURL: importcorrectSound)
        } catch let error as NSError {
            print("AV Sound Error: \(error.localizedDescription)")
        }
        
        correctSound.prepareToPlay()
        
        do {
            wrongSound = try AVAudioPlayer(contentsOfURL: importwrongSound)
        } catch let error as NSError {
            print("AV Sound Error: \(error.localizedDescription)")
        }
        
        wrongSound.volume = 0.25
        wrongSound.prepareToPlay()

        questions =
        
        [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
        Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
        Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
        Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
        Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
        Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
        
        
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
        
        pressButton(1)
    }
    
    @IBAction func button2(sender: AnyObject) {
        
        pressButton(2)
    }
    
    @IBAction func button3(sender: AnyObject) {
        
        pressButton(3)
    }
    
    @IBAction func button4(sender: AnyObject) {
        
        pressButton(4)
    }
    
    func pressButton(number: Int){
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        aButtons[0].setTitleColor(UIColor.redColor() , forState: UIControlState.Normal)
        aButtons[1].setTitleColor(UIColor.redColor() , forState: UIControlState.Normal)
        aButtons[2].setTitleColor(UIColor.redColor() , forState: UIControlState.Normal)
        aButtons[3].setTitleColor(UIColor.redColor() , forState: UIControlState.Normal)
    
        aButtons[aNumber-1].setTitleColor(UIColor.yellowColor() , forState: UIControlState.Normal)
        
        if aNumber == number{
            correctSound.play()
            score = score + 1
            print("Correct")
        }
        else{
            wrongSound.play()
            print("Wrong")
        }
        
        print(score)
        displayScore.text = String(score)
        
        let myTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(1.25, target: self, selector: Selector("nextQuestion:"), userInfo: nil, repeats: false)
        
    }
    
    func nextQuestion(timer : NSTimer){
        
        aButtons[0].setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
        aButtons[1].setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
        aButtons[2].setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
        aButtons[3].setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
        
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
        
        PickQuestion()
        
    }
    
    

}
