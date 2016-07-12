//
//  ViewController.swift
//  Gimmie Weather
//
//  Created by keivn c on 7/8/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func searchWeather(sender: AnyObject) {
        
        var wasSuccess = false
        
        let attemptUrl = NSURL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if let url = attemptUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    let websiteArray = webContent!.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                    if websiteArray.count > 1 {
                        
                        wasSuccess = true
                        
                        let weatherArray = websiteArray[1].componentsSeparatedByString("</span>")
                        
                        if weatherArray.count > 1 {
                            
                            let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º ")
                            
                            dispatch_async(dispatch_get_main_queue(), {
                                
                                self.resultLabel.text = weatherSummary
                            })
                        }
                    }
                }
                
                if wasSuccess == false {
                    
                    dispatch_async(dispatch_get_main_queue(), { 
                        self.resultLabel.text = "Please enter a valid city"
                    })
                }
            }
            task.resume()
            
        } else {
            
            dispatch_async(dispatch_get_main_queue(), {
                self.resultLabel.text = "Please enter a valid city"
            })
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

