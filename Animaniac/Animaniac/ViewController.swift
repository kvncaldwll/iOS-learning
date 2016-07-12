//
//  ViewController.swift
//  Animaniac
//
//  Created by keivn c on 7/8/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var i = 1
    
    var timer = NSTimer()
    
    var isAnimated = false
    
    @IBOutlet weak var charizardImage: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject) {
        
        if isAnimated == false {
        
            timer = NSTimer.scheduledTimerWithTimeInterval(0.12, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimated = true
        } else {
            timer.invalidate()
            isAnimated = false
        }
    }

    
    func doAnimation() {
        if i == 8 {
            i = 1
        } else {
            i += 1
        }
        charizardImage.image = UIImage(named: "frame\(i).png")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    override func viewDidLayoutSubviews() {
//        charizardImage.center = CGPointMake(charizardImage.center.x - 400, charizardImage.center.y)
//        charizardImage.alpha = 0
//        charizardImage.frame = CGRectMake(100, 20, 0, 0)
//    }
//    
//    
//    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(1, animations: { () -> Void in
//            self.charizardImage.center = CGPointMake(self.charizardImage.center.x + 400, self.charizardImage.center.y)
//            self.charizardImage.alpha = 1
//            self.charizardImage.frame = CGRectMake(100, 20, 200, 200)
//        })
//    }
    
}

