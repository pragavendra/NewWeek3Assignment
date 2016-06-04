//
//  MailBoxViewController.swift
//  NewWeek3Assignment
//
//  Created by Padmaja Ragavendra on 6/4/16.
//  Copyright © 2016 Padmaja Ragavendra. All rights reserved.
//

import UIKit

class MailBoxViewController: UIViewController {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var messageOriginalCenter: CGPoint!
    var messageLeftOffset: CGFloat!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        messageLeftOffset = 0
        messageLeft = messageView.center

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didpanMessage(sender: UIPanGestureRecognizer) {
            let translation = sender.translationInView(view)
            let velocity = sender.velocityInView(view)
            
            if sender.state == UIGestureRecognizerState.Began {
                messageOriginalCenter = messageView.center
                
            } else if sender.state == UIGestureRecognizerState.Changed {
                messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
                
            } else if sender.state == UIGestureRecognizerState.Ended {
                
            }

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
