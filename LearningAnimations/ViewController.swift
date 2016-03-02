//
//  ViewController.swift
//  LearningAnimations
//
//  Created by Martynas Kausas on 3/2/16.
//  Copyright © 2016 Marty Kausas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var macklemoreImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onAnimateButtonPress(sender: AnyObject) {
     

        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            // drop, lose transperency, 4x scale
            self.macklemoreImageView.center.y += 200
            self.macklemoreImageView.alpha = 1
            self.macklemoreImageView.transform = CGAffineTransformMakeScale(4, 4)
            
        }) { (finished: Bool) -> Void in

            
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                // rotate to one side
                let radians = CGFloat(-15 * M_PI / 180)
                self.macklemoreImageView.transform = CGAffineTransformRotate(self.macklemoreImageView.transform, radians)
                
                }, completion: { (finished: Bool) -> Void in
                    UIView.animateWithDuration(0.5, delay: 0, options: [UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat], animations: { () -> Void in
                        
                        // repeat rotation
                        let radians = CGFloat(30 * M_PI / 180)
                        self.macklemoreImageView.transform = CGAffineTransformRotate(self.macklemoreImageView.transform, radians)
                        }, completion: nil)
            })
            
 
            
            
            
 
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

