 //
//  ViewController.swift
//  Lumosity Color Match
//
//  Created by Apple on 30.12.16.
//  Copyright © 2016 KBTU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rightAnswer = 0
    var wrongAnswer = 0
    var seconds = 59
    var timer = Timer()
    
    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var rightCounter: UILabel!
    @IBOutlet var wrongCounter: UILabel!
    @IBOutlet var secondTimer: UILabel!
    @IBOutlet var minuteTimer: UILabel!
    
    let colors = [UIColor.black, UIColor.blue, UIColor.brown, UIColor.red, UIColor.green, UIColor.yellow,
                  UIColor.orange, UIColor.purple, UIColor.gray]
    
    let colorsTitle = ["BLACK", "BLUE", "BROWN", "RED", "GREEN", "YELLOW", "ORANGE", "PURPLE", "GRAY"]
    
    var leftColorIndex = 0
    var leftTitleIndex = 0
    var rightColorIndex = 0
    var rightTitleIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
        timerCounter()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func timerCounter() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secVC: SecondViewController = segue.destination as! SecondViewController
    
                secVC.correct = rightAnswer
                secVC.wrong = wrongAnswer
    }
    
    func updateTimer() {
        
        seconds -= 1
        
        if(seconds == 0) {
            
            secondTimer.text = "00"
            timer.invalidate()
            
            let alertController = UIAlertController(title: "Time is up! Your score: ", message: "Correct answer: \(rightAnswer) \nWrong answer: \(wrongAnswer)", preferredStyle: .alert)
            
            leftColorIndex = 0
            leftTitleIndex = 0
            rightColorIndex = 0
            rightTitleIndex = 0
            rightAnswer = 0
            wrongAnswer = 0
            statusLabel.text = nil
            statusLabel.backgroundColor = nil
            rightCounter.text = "0"
            wrongCounter.text = "0"
            
            setupViews()
            
            
            let defaultAction = UIAlertAction(title: "Restart", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
            seconds = 59
            timerCounter()
            
        }
            
        else if (seconds < 10) {
            
            secondTimer.text = "0\(seconds)"
        }
            
        else {
            
            secondTimer.text = "\(seconds)"
        }
        
        
        
    }
    
    func setupViews() {
        
        leftColorIndex = Int( arc4random_uniform(UInt32(colors.count)) )
        leftTitleIndex = Int( arc4random_uniform(UInt32(colors.count)) )
        rightColorIndex = Int( arc4random_uniform(UInt32(colors.count)) )
        rightTitleIndex = Int( arc4random_uniform(UInt32(colors.count)) )

        leftLabel.text = colorsTitle[leftTitleIndex]
        leftLabel.backgroundColor = colors[leftColorIndex]
        rightLabel.text = colorsTitle[rightTitleIndex]
        rightLabel.backgroundColor = colors[rightColorIndex]
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        
        if(leftTitleIndex == rightColorIndex) {
            self.statusLabel.text = "Right!"
            self.statusLabel.backgroundColor = UIColor.green
            rightAnswer += 1
            self.rightCounter.text = String(rightAnswer)
        }
        else {
            self.statusLabel.text = "Wrong!"
            self.statusLabel.backgroundColor = UIColor.red
            wrongAnswer += 1
            self.wrongCounter.text = String(wrongAnswer)
        }
        
        setupViews()
    }

    @IBAction func noButtonPressed(_ sender: UIButton) {
        
        if(leftTitleIndex != rightColorIndex) {
            self.statusLabel.text = "Right!"
            self.statusLabel.backgroundColor = UIColor.green
            rightAnswer += 1
            self.rightCounter.text = String(rightAnswer)
        }
        else {
            self.statusLabel.text = "Wrong!"
            self.statusLabel.backgroundColor = UIColor.red
            wrongAnswer += 1
            self.wrongCounter.text = String(wrongAnswer)
        }
        
        setupViews()
        
    }

}

