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
    
    var importmusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Hearthstonepiano", ofType: "mp3")!)
    var bgm = AVAudioPlayer()
    
    @IBOutlet var qLabel: UILabel!
    @IBOutlet var aButtons: [UIButton]!
    @IBOutlet var backLabel: UIButton!
    
    
    var questionchosen = Int()
    
    var questionsarray = [[Question]]()
    var questions = [Question]()
    
    var qNumber = Int() // Question Number
    var aNumber = Int() // Answer Number
    
    
    @IBOutlet var displayScore: UILabel!
    @IBOutlet var displayTimeLeft: UILabel!
    
    var score = 0
    var timeleft = 7
    
    var clock = NSTimer()
    
    
    @IBOutlet var gameoverscreen: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        clock = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countdown:"), userInfo: nil, repeats: true)

        
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
        
        
        do {
            bgm = try AVAudioPlayer(contentsOfURL: importmusic)
        } catch let error as NSError {
            print("AV Sound Error: \(error.localizedDescription)")
        }
        
        bgm.numberOfLoops = -1
        bgm.play()
        
        
        //Level 1
        questionsarray.append(
        
        [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
            Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
            Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
            Question(question: "What is the name of the standard hero for mages?", answers: ["Alleria Windrunner", "Valeera Sanguinar", "Jane Elizabeth", "Jaina Proudmoore"], answer: 4),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3", "4", "5", "6"], answer: 3),
            Question(question: "How many secrets does the Hunter class have?", answers: ["5", "6", "7", "8"], answer: 3),
            Question(question: "What is the maximum number of cards you can hold in your hand?", answers: ["9", "10", "11", "12"], answer: 2),
            Question(question: "How much mana is overloaded after playing Earth Elemental?", answers: ["1", "2", "3", "4"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3),
            Question(question: "Mana cost for Leeroy Jenkins", answers: ["3 mana", "4 mana", "5 mana", "6 mana"], answer: 3)]
        
            )
        
        
        //Level 2
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 3
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 4
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 5
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 6
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 7
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 8
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 9
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 10
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 11
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 12
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 13
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 14
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 15
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 16
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        //Level 17
        questionsarray.append(
            
            [Question(question: "What is the most amount of gold you can win in the Arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 3),
                Question(question: "Who is the Lead Designer for Hearthstone?", answers: ["Reno Jackson", "Ben Brode", "Trump", "Michael Morhaime"], answer: 2),
                Question(question: "In what year was Hearthstone released?", answers: ["2012", "2013", "2014", "2015"], answer: 3),
                Question(question: "What card back do you get for achieving Rank 20 in Ranked Season 1?", answers: ["Pandaria", "Pirates!", "Ragnaros", "Naxxramas"], answer: 1),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4),
                Question(question: "What is the most amount of gold you can in the arena?", answers: ["155 gold", "170 gold", "185 gold", "200 gold"], answer: 4)]
            
        )
        
        
        questions = questionsarray[questionchosen-1]
        PickQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
            gameoverscreen.hidden = false
            self.view.backgroundColor = UIColor.blackColor()
            self.view.alpha = 0.8
            clock.invalidate()
            aButtons[0].enabled = false
            aButtons[1].enabled = false
            aButtons[2].enabled = false
            aButtons[3].enabled = false
            backLabel.enabled = false
            bgm.stop()
            
            
            
        }
        
        


    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "gameover"){
            let Dest : GameOverViewController = segue.destinationViewController as! GameOverViewController
            Dest.questionchosen = questionchosen
        }
    }
    
    func countdown(timer : NSTimer)  {
        
        print (timeleft)
        displayTimeLeft.text = String(timeleft)
        if timeleft > 0 {
            timeleft--
        }
        else {
            
            timeleft = 7
            
            wrongSound.play()
            
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            aButtons[0].setTitleColor(UIColor.redColor() , forState: UIControlState.Normal)
            aButtons[1].setTitleColor(UIColor.redColor() , forState: UIControlState.Normal)
            aButtons[2].setTitleColor(UIColor.redColor() , forState: UIControlState.Normal)
            aButtons[3].setTitleColor(UIColor.redColor() , forState: UIControlState.Normal)
            
            aButtons[aNumber-1].setTitleColor(UIColor.yellowColor() , forState: UIControlState.Normal)
            
            let myTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(1.25, target: self, selector: Selector("nextQuestion:"), userInfo: nil, repeats: false)
        }
        
    }
    
    
    
    @IBAction func backButton(sender: AnyObject) {
        clock.invalidate()
        bgm.stop()
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
        
        timeleft = 7
        
        let myTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(1.25, target: self, selector: Selector("nextQuestion:"), userInfo: nil, repeats: false)
        
    }
    
    func nextQuestion(timer : NSTimer){
        
        aButtons[0].setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
        aButtons[1].setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
        aButtons[2].setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
        aButtons[3].setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
        
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
        
        timeleft = 7

        PickQuestion()
        
    }
    
    

}
