//
//  ViewController.swift
//  Bopit
//
//  Created by Gray, Nathan on 4/4/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var pullIt: UIImageView!
    @IBOutlet weak var twistIt: UIImageView!
    @IBOutlet weak var bopIt: UIImageView!
    @IBOutlet weak var bottomBoundry: UIImageView!
    @IBOutlet weak var rightBoundry: UIImageView!
    @IBOutlet weak var score: UILabel!
    var realScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeTimer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Gesture Handlers
    
    @IBAction func handlePullPan(_ recognizer:UIPanGestureRecognizer) {
        
            
            let translation = recognizer.translation(in: self.view)
            
            let vel = recognizer.velocity(in: self.view)
            
            if vel.y > 0 {
                
                if let view = recognizer.view {
                    view.center = CGPoint(x:view.center.x,
                                          y:view.center.y + translation.y)
                    
                }
                
            }
            
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if recognizer.state == .ended {
            resetPull()
        }
        
        
    }

    @IBAction func handleTwistPan(_ recognizer:UIPanGestureRecognizer) {
        
        
        let translation = recognizer.translation(in: self.view)
        
        let vel = recognizer.velocity(in: self.view)
        
        if vel.x > 0 {
            
            if let view = recognizer.view {
                view.center = CGPoint(x:view.center.x + translation.x,
                                      y:view.center.y)
                
            }
            
        }
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if recognizer.state == .ended {
            resetTwist()
        }
        
        
    }
    
    @IBAction func handleBopTap(_ recognizer: UITapGestureRecognizer) {
        
        realScore += 1
        score.text = String(realScore)
        
    }
    

    
    //MARK: Reset Objects

    func resetPull() {
        
        pullIt.frame = CGRect(x: 141, y: 436, width: 92, height: 133)
        
    }
    
    func resetTwist() {
        
        twistIt.frame = CGRect(x: 99, y: 114, width: 177, height: 128)
        
    }
    
    //MARK: Game Logic
    
    func gameLogic(theTimer: CADisplayLink) {
       
        if pullIt.frame.intersects (bottomBoundry.frame) {
            realScore += 1
            resetPull()
            score.text = String(realScore)
        }
        
        if twistIt.frame.intersects (rightBoundry.frame) {
            realScore += 1
            resetTwist()
            score.text = String(realScore)
        }
        
        
    }
    
    func initializeTimer() {
        
        let theTimer = CADisplayLink(target: self, selector: #selector(gameLogic(theTimer:)))
        
        theTimer.preferredFramesPerSecond = 30
        theTimer.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
        
        
    }
    
}

