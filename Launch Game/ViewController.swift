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
   
    var timer = Timer()
    var binaryCount = 200
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startTimer (_ sender: AnyObject) {
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: "countDown", userInfo: nil, repeats: true)
         Reset.isHidden = false
        StartButton.isHidden = true
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
         CountDown.text = String(binaryCount)
    }
}

