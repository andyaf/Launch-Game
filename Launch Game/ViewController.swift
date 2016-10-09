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
   
    

    var count = 120

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //randon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startTimer (_ sender: AnyObject) {
    
    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        Reset.isHidden = false
        StartButton.isHidden = true
    }
    
    
    
    
    @IBAction func resetButton (_ sender: AnyObject) {
        
        Reset.isHidden = true
        StartButton.isHidden = false
        count = 200
        timer.invalidate()
    }
    
    //Problem: Your are firing update Twice
    
    func update()  {
        if (count > 0) {
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            if (seconds == "0") {
            CountDown.text = minutes + ":" + seconds + "0"
            } else {
            CountDown.text = minutes + ":" + seconds
            }
            count -= 1
        }
    }
    
   
}

