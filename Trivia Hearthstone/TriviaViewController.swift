//
//  TriviaViewController.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/4/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON
import iAd
import CoreData

/*
struct Question {
    var question : String!
    var answers : [String]!
    var answer : Int!
}
*/

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
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
/*
    var questionsarray = [[Question]]()
    var questions = [Question]()
*/
    
    var Level = String() // Level Number
    var qNumber = String() // Question Number
    var correct = Int() // Correct Answer
    
    
    @IBOutlet var displayScore: UILabel!
    @IBOutlet var displayTimeLeft: UILabel!
    
    var score = 0
    var timeleft = 7
    var order = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].shuffle()
    
    var clock = NSTimer()
    
    
    @IBOutlet var gameoverscreen: UIView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkads()
        
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
        
        let path : String = NSBundle.mainBundle().pathForResource("QuestionsData", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        if order.count > 0 {
            
            Level = "Level" + "\(questionchosen)"
            
            qNumber = "Question" + String(order[0])
            
            correct = Int(readableJSON[Level][qNumber]["Correct"].string as String!)!
            
            qLabel.text =  readableJSON[Level][qNumber]["Question"].string as String!
            
            for i in 0..<aButtons.count{
                
                let AnswerNumber = "Answer" + String(i+1)
                let theanswer = readableJSON[Level][qNumber][AnswerNumber].string! as String
                aButtons[i].setTitle(theanswer, forState: UIControlState.Normal)
            }
            
            order.removeAtIndex(0)
        }
        
        else {
            
            
            let userFetch = NSFetchRequest(entityName: "User")
            
            do{
                let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
                
                if (fetchedUser.first!.removeads == false) {
                    Chartboost.showInterstitial(CBLocationDefault)
                }
                
                
            } catch {
                fatalError("Core Data Error")
            }
            
            gameover()
        }
    }
    
    func gameover(){
        
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
            
            aButtons[correct-1].setTitleColor(UIColor.yellowColor() , forState: UIControlState.Normal)
            
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
        
        
    
        aButtons[correct-1].setTitleColor(UIColor.yellowColor() , forState: UIControlState.Normal)
        
        if correct == number{
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
    
    func checkads() {
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        do{
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            
            if (fetchedUser.first!.removeads == true) {
                self.canDisplayBannerAds = false
            }
            
            
        } catch {
            fatalError("Core Data Error")
        }
        
    }
}
