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
    var menuTransform = CATransform3DIdentity
    var feedTransform = CATransform3DIdentity
//    var transform = CGAffineTransformMakeScale(0.9, 0.9)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       menuViewController = storyboard?.instantiateViewControllerWithIdentifier("MenuViewController") as MenuViewController
       
       feedViewController = storyboard?.instantiateViewControllerWithIdentifier("FeedViewController") as FeedViewController
        
        self.addChildViewController(feedViewController)
        self.addChildViewController(menuViewController)
        
        view.addSubview(menuViewController.view)
        view.addSubview(feedViewController.view)
        
        menuTransform.m34 = 1.0/2500.0
        menuTransform = CATransform3DTranslate(menuTransform, -160, 0, 0)    // translate 50% to the right
        menuTransform = CATransform3DRotate(menuTransform, CGFloat(120 * M_PI / 180), 0, 1, 0) // rotate 90 degrees
        menuTransform = CATransform3DTranslate(menuTransform, 160, 0, 0)   // translate 50% to the left
        menuViewController.view.layer.transform = menuTransform
        menuViewController.view.alpha = 0.5
        
        feedTransform.m34 = 1.0 / 2500.0
        feedTransform = CATransform3DTranslate(feedTransform, 320, 0, 0)    // translate 50% to the right
        feedTransform = CATransform3DRotate(feedTransform, CGFloat(68 * M_PI / 180), 0, 1, 0) // rotate 90 degrees
        feedTransform = CATransform3DTranslate(feedTransform, -320, 0, 0)   // translate 50% to the left
    }

    @IBAction func onDrag(sender: UIPanGestureRecognizer) {
        var velocity = sender.velocityInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Ended {
            if velocity.x > 0 {
                // swiping menu to the right reveals the menu underneath the feed
                UIView.animateWithDuration(2, animations: { () -> Void in
                  //  self.feedViewController.view.frame.origin.x  = 270
                    self.feedViewController.view.layer.transform = self.feedTransform
                    self.menuViewController.view.alpha = 1
                    self.menuViewController.view.layer.transform = CATransform3DIdentity
                })
            } else {
                // swiping menu to the left puts the menu back in its default place
                UIView.animateWithDuration(2, animations: { () -> Void in
                  //  self.feedViewController.view.frame.origin.x  = 0
                    self.feedViewController.view.layer.transform = CATransform3DIdentity
                    self.menuViewController.view.alpha = 0.5
                    self.menuViewController.view.layer.transform = self.menuTransform
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
