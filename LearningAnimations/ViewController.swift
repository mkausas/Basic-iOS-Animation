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
    @IBOutlet weak var griffinImageView: UIImageView!
    
    var previousGriffinPoint: CGPoint!
    
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
    
    @IBAction func onGriffinDrag(sender: UIPanGestureRecognizer) {
        
//        let location = sender.locationInView(view)
//        let velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("began")

            previousGriffinPoint = griffinImageView.center

            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.griffinImageView.transform = CGAffineTransformScale(self.griffinImageView.transform, 1.3, 1.3)
            })
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("changed")
            
            var center = previousGriffinPoint
            center.x += translation.x
            center.y += translation.y
            
            griffinImageView.center = center
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("Ended")
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                print("Happening")
                self.griffinImageView.transform = CGAffineTransformScale(self.griffinImageView.transform, 0.77, 0.77)
            })
        }
        
    }
    
    @IBAction func onGriffinPinch(sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        
        print("scale")
        
        griffinImageView.transform = CGAffineTransformMakeScale(scale, scale)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

