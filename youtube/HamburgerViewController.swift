//
//  HamburgerViewController.swift
//  youtube
//
//  Created by diane cronenwett on 11/6/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    var menuViewController: MenuViewController!
    var feedViewController: FeedViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       menuViewController = storyboard?.instantiateViewControllerWithIdentifier("MenuViewController") as MenuViewController
       
       feedViewController = storyboard?.instantiateViewControllerWithIdentifier("FeedViewController") as FeedViewController
        
        self.addChildViewController(menuViewController)
        self.addChildViewController(feedViewController)
        
        view.addSubview(menuViewController.view)
        view.addSubview(feedViewController.view)
        
        menuViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
    }

    @IBAction func onDrag(sender: UIPanGestureRecognizer) {
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Ended {
            if velocity.x > 0 {
                // swiping menu to the right reveals the menu underneath the feed
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.feedViewController.view.frame.origin.x  = 270
                    self.menuViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
                
            } else {
                // swiping menu to the left puts the menu back in its default place
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.feedViewController.view.frame.origin.x  = 0
                    self.menuViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9)

                })
            }
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
