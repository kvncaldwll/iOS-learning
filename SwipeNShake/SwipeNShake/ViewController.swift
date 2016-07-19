//
//  ViewController.swift
//  SwipeNShake
//
//  Created by keivn c on 7/19/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    var sounds = ["hooray", "laugh", "scratch", "splash", "swoosh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "swiped:") //depricated use, above is proper convention
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            print("shake it off")
            
//            var random = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let fileLocation = NSBundle.mainBundle().pathForResource("laugh", ofType: "wav")
            
            do {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                player.play()

            } catch { }
        }
    }

    
    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Right:
                print("right is wrong")
                
                let fileLocation = NSBundle.mainBundle().pathForResource("swoosh", ofType: "wav")
                
                do {
                    try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                    player.play()
                    
                } catch { }
                
            case UISwipeGestureRecognizerDirection.Up:
                print("up up and away!")
                
                let fileLocation = NSBundle.mainBundle().pathForResource("hooray", ofType: "wav")
                
                do {
                    try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                    player.play()
                    
                } catch { }
                
            case UISwipeGestureRecognizerDirection.Left:
                print("left alone")
                
                let fileLocation = NSBundle.mainBundle().pathForResource("scratch", ofType: "wav")
                
                do {
                    try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                    player.play()
                    
                } catch { }
                
            case UISwipeGestureRecognizerDirection.Down:
                print("down for the count")
                
                let fileLocation = NSBundle.mainBundle().pathForResource("splash", ofType: "wav")
                
                do {
                    try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                    player.play()
                    
                } catch { }
                
            default:
                break
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

