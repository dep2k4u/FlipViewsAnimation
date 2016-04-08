//
//  ViewController.swift
//  FlipViewTutorial
//
//  Created by Deep-MacMini on 4/8/16.
//  Copyright © 2016 Deep-MacMini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var frontView: UIView!
    
    @IBOutlet weak var backView: UIView!
   
    @IBOutlet  var frontViewPermanent: UIView!
    @IBOutlet var backViewPermanent: UIView!
    var showingFront = true
    
       override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func returnCopyOfView(view:UIView)->UIView{
        let data:NSData = NSKeyedArchiver.archivedDataWithRootObject(view)
        let copyView = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! UIView
        return copyView
    }
    
    @IBAction func tapped(sender: AnyObject) {
       
       // frontView.userInteractionEnabled = true
       
        if (showingFront) {
          
            self.backView = returnCopyOfView(self.backViewPermanent)
            UIView.transitionFromView(self.frontView, toView: self.backView, duration: 01, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
                 self.showingFront = false
                 //self.view.addSubview(self.frontView)
                // self.view.sendSubviewToBack(self.frontView)
                    
        }
        
        
        else {
         
            self.frontView = returnCopyOfView(self.frontViewPermanent)
            UIView.transitionFromView(self.backView, toView: self.frontView, duration: 01, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
                self.showingFront = true
//                self.view.addSubview(self.backView)
//                self.view .sendSubviewToBack(self.backView)
            
            }
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   


}

