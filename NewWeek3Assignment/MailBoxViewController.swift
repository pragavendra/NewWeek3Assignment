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
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var rescheduleView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var iconView: UIImageView! //message view
    @IBOutlet weak var IconUIView: UIView!
    @IBOutlet weak var listIconView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var leftIconView: UIView!
    @IBOutlet weak var archiveImage: UIImageView!
    @IBOutlet weak var deleteImage: UIImageView!
    @IBOutlet weak var rescheduleImageView: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    var messageLeftOffset: CGFloat!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!
    
    var iconOriginalCenter: CGPoint!
    var iconOffset: CGPoint!
    
    var iconLeftOriginalCenter: CGPoint!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        messageLeftOffset = 0
        messageLeft = messageView.center
        messageRight = CGPoint(x: messageView.center.x + messageLeftOffset ,y: messageView.center.y )
        
        // The onCustomTap: method will be defined in Step 3 below.
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        
        // Optionally set the number of required taps, e.g., 2 for a double click
        tapGestureRecognizer.numberOfTapsRequired = 1;
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        rescheduleView.userInteractionEnabled = true
        rescheduleView.addGestureRecognizer(tapGestureRecognizer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func onCustomTap(sender: UITapGestureRecognizer) {
        let point = sender.locationInView(view)
        
        // User tapped at the point above. Do something with that if you want.
        print("inside custom tap")
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.messageView.center = self.messageLeft
            self.leftIconView.center = CGPoint(x: 0,y: self.iconLeftOriginalCenter.y)
            })

        IconUIView.center = CGPoint(x: 320,y: iconOriginalCenter.y)
        listView.alpha = 1
        messageView.alpha = 1
        backgroundView.alpha = 1
        rescheduleView.alpha = 0
        IconUIView.alpha = 0
        listIconView.alpha = 0
        iconImageView.alpha = 0

    }

    

    @IBAction func didpanMessage(sender: UIPanGestureRecognizer) {
            let translation = sender.translationInView(view)
            let velocity = sender.velocityInView(view)
        
            if sender.state == UIGestureRecognizerState.Began {
                messageOriginalCenter = messageView.center
                iconOriginalCenter = IconUIView.center
                iconLeftOriginalCenter = leftIconView.center
                
               // print( "translation began \(translation)")
               // print( "velocity began \(velocity)")
                
                backgroundView.backgroundColor = UIColor.grayColor()
                listView.alpha = 1
                messageView.alpha = 1
                backgroundView.alpha = 1
                if velocity.x < 0 {
                    rescheduleView.alpha = 0
                    listIconView.alpha = 0
                }
                else {
                    leftIconView.alpha = 0
                    archiveImage.alpha = 0
                    deleteImage.alpha = 0
                    
                }
                
            } else if sender.state == UIGestureRecognizerState.Changed {
                messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
               IconUIView.center = CGPoint(x: iconOriginalCenter.x + translation.x + 40 , y: iconOriginalCenter.y)
                leftIconView.center = CGPoint(x: iconLeftOriginalCenter.x + translation.x - 45 , y: iconLeftOriginalCenter.y)

                if velocity.x < 0 {
                    //panning left
                    //print( "velocity panning left  \(messageView.center)")
                    if messageView.center.x < -100{
                        //print( "messagecenter \(messageView.center.x)")
                        backgroundView.backgroundColor = UIColor.brownColor()
                        listView.alpha = 1
                        messageView.alpha = 1
                        backgroundView.alpha = 1
                        rescheduleView.alpha = 0
                        listIconView.alpha = 1
                        iconImageView.alpha = 0
                    
                    
                    }
                    else  if messageView.center.x < 90 {
                        // print( "messagecenter inside 90 \(messageView.center.x)")
                       /* listView.alpha = 1
                        messageView.alpha = 1
                        backgroundView.alpha = 1
                        rescheduleView.alpha = 0
                        backgroundView.backgroundColor = UIColor.yellowColor()*/
                    
            
                    }
                    else  if messageView.center.x < 100 {
                        // print( "messagecenter inside 100 \(messageView.center.x)")

                        listView.alpha = 1
                        messageView.alpha = 1
                        backgroundView.alpha = 1
                        rescheduleView.alpha = 0
                        listIconView.alpha = 0
                        iconImageView.alpha = 1

                        backgroundView.backgroundColor = UIColor.yellowColor()
                    
                    
                    }
                    else {
                        // print( "messagecenter default  \(messageView.center.x)")
                        listView.alpha = 1
                            messageView.alpha = 1
                        backgroundView.alpha = 0.2
                        rescheduleView.alpha = 0
                        IconUIView.alpha = 1
                        listIconView.alpha = 0
                        iconImageView.alpha = 1
                        backgroundView.backgroundColor = UIColor.grayColor()
                    }
                } else {
                    //panning right
                   // print( "velocity panning right  \(messageView.center)")
                    if messageView.center.x > 410  {
                        backgroundView.backgroundColor = UIColor.redColor()
                        leftIconView.alpha = 1
                        archiveImage.alpha = 0
                        deleteImage.alpha = 1
                        backgroundView.alpha = 1

                    }
                    else if messageView.center.x > 210   {
                        backgroundView.backgroundColor = UIColor.greenColor()
                        leftIconView.alpha = 1
                        archiveImage.alpha = 1
                        backgroundView.alpha = 1
                        deleteImage.alpha = 0
                        
                    } else {
                        // print( "messagecenter default  \(messageView.center.x)")
                        listView.alpha = 1
                        messageView.alpha = 1
                        backgroundView.alpha = 0.2
                        leftIconView.alpha = 1
                        archiveImage.alpha = 1
                        deleteImage.alpha = 0

                        backgroundView.backgroundColor = UIColor.grayColor()

                    }

                    
                }
                
            } else if sender.state == UIGestureRecognizerState.Ended {
                print( "messagecenter inside ended first \(messageView.center)")
                if messageView.center.x < 100 &&  messageView.center.x > -135 {
                    print( "messagecenter inside ended \(messageView.center)")
                    
                    listView.alpha = 0
                    messageView.alpha = 0
                    backgroundView.alpha = 0
                    rescheduleView.alpha = 1
                    listIconView.alpha = 0
                    iconImageView.alpha = 0
                    backgroundView.backgroundColor = UIColor.yellowColor()
                    
                } else {

                
                    if velocity.x > 0 {
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.messageView.center = self.messageLeft
                            self.leftIconView.center = CGPoint(x: 0,y: self.iconLeftOriginalCenter.y)
                        })
                    } else {
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.messageView.center = self.messageRight
                        })
                        IconUIView.center = CGPoint(x: 320,y: iconOriginalCenter.y)
                        listView.alpha = 1
                        messageView.alpha = 1
                        backgroundView.alpha = 1
                        rescheduleView.alpha = 0
                        IconUIView.alpha = 0
                        listIconView.alpha = 0
                        iconImageView.alpha = 0
                        archiveImage.alpha = 0
                        deleteImage.alpha = 0

                    }//velocity
               
                }//check <100
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
