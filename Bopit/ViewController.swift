//
//  ViewController.swift
//  Bopit
//
//  Created by Gray, Nathan on 4/4/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pullIt: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Gesture Handlers
    
    @IBAction func handlePan(_ recognizer:UIPanGestureRecognizer) {
        
            
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
            resetArrow()
        }
        
        
    }
    
    //MARK: Reset Objects

    func resetArrow() {
        
        pullIt.frame = CGRect(x: 141, y: 436, width: 92, height: 133)
        
    }

}

