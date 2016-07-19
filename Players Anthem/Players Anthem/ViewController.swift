//
//  ViewController.swift
//  Players Anthem
//
//  Created by keivn c on 7/18/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
    }
    
    @IBAction func volumeController(sender: AnyObject) {
        
        player.volume = slider.value
    }
    
    @IBOutlet weak var slider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = NSBundle.mainBundle().pathForResource("playersanthem", ofType: "mp3")!
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
        } catch {
            // handle error here
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

