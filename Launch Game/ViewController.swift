//
//  ViewController.swift
//  Launch Game
//
//  Created by Andrew Arce on 10/4/16.
//  Copyright © 2016 Andrew Arce. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {
    
    @IBOutlet var CountDown: UILabel!
    @IBOutlet var Reset: UIButton!
    @IBOutlet var StartButton: UIButton!
    @IBOutlet weak var MissleType: UILabel!
    @IBOutlet weak var Arm: UIButton!
    @IBOutlet weak var Lock: UIButton!
    @IBOutlet weak var Fire: UIButton!
    
    
 
    var timer = Timer()
    var binaryCount = 200
    

    override func viewDidLoad() {
        super.viewDidLoad()
       Reset.isHidden = true
       Arm.isHidden = true
        Lock.isHidden = true
        Fire.isHidden = true
    
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Arm(_ sender: AnyObject) {
    Lock.isHidden = false
    Arm.isHidden = true
    }
    
    @IBAction func Lock(_ sender: AnyObject) {
        Lock.isHidden = true
        Fire.isHidden = false
        
    }
    
    @IBAction func Fire(_ sender: AnyObject) {
        
        
    }

    
    
    @IBAction func startTimer (_ sender: AnyObject) {
        updateText()
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: "countDown", userInfo: nil, repeats: true)
         Reset.isHidden = false
        StartButton.isHidden = true
        var missleDisplay = Misssle(missleCall: "Nuclear Missle Detected")
        MissleType.text = missleDisplay.missleCall
        Arm.isHidden = false
       }
    
  
    
    
    @IBAction func resetButton (_ sender: AnyObject) {
        timer.invalidate()
        StartButton.isHidden = false
        Reset.isHidden = true
        binaryCount = 200
        updateText()
    }

    
    func countDown () {
        if binaryCount > 0 {
            binaryCount -= 1
           updateText()
        } else {
            updateText()
        }
    }
    
    func updateText () {
        var minutes = binaryCount / 60
        var seconds = binaryCount % 60
        if (seconds <= 9){
        CountDown.text = String(minutes) + ":" + String(0) + String(seconds)
        } else {
        CountDown.text = String(minutes) + ":" + String(seconds)

            }
    }
}

