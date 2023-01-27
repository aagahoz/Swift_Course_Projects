//
//  ViewController.swift
//  catchTheKennyGame
//
//  Created by Agah Özdemir on 25.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    var score = 0
    var counter = 0
    var timer = Timer()
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    // Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        // HighScore check
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "\(highScore)"

        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "\(highScore)"
        }
        
        //        configurated from imageView Settings
        //        kenny1.isUserInteractionEnabled = true
        //        kenny2.isUserInteractionEnabled = true
        //        kenny3.isUserInteractionEnabled = true
        //        kenny4.isUserInteractionEnabled = true
        //        kenny5.isUserInteractionEnabled = true
        //        kenny6.isUserInteractionEnabled = true
        //        kenny7.isUserInteractionEnabled = true
        //        kenny8.isUserInteractionEnabled = true
        //        kenny9.isUserInteractionEnabled = true
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(clickedPicture))
        
        kenny1.addGestureRecognizer(gestureRecognizer1)
        kenny2.addGestureRecognizer(gestureRecognizer2)
        kenny3.addGestureRecognizer(gestureRecognizer3)
        kenny4.addGestureRecognizer(gestureRecognizer4)
        kenny5.addGestureRecognizer(gestureRecognizer5)
        kenny6.addGestureRecognizer(gestureRecognizer6)
        kenny7.addGestureRecognizer(gestureRecognizer7)
        kenny8.addGestureRecognizer(gestureRecognizer8)
        kenny9.addGestureRecognizer(gestureRecognizer9)
        
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        // Timers
        counter = 10
        timeLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(kennyHide), userInfo: nil, repeats: true)
        
        kennyHide()
        
        
        
    }
    
    @objc func kennyHide()  {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
    }
    
    
    @objc func clickedPicture()
    {
        score += 1
        scoreLabel.text = "\(score)"
    }
    
    @objc func countDown()
    {
        counter -= 1
        timeLabel.text = "\(counter)"
        if counter == 0
        {
            timer.invalidate()
            hideTimer.invalidate()
            
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            // HighScore
            
            if self.score > self.highScore {
                self.highScore = score
                highScoreLabel.text = "HighScore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
            
            // Alert
            let alert = UIAlertController(title: "Time is Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.destructive) {
                (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "\(self.score)"
                self.counter = 10
                self.timeLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.kennyHide), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }
}

