//
//  ViewController.swift
//  DL Web Content
//
//  Created by keivn c on 7/7/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string:"https://www.reddit.com")!
        self.webView.loadRequest(NSURLRequest(URL: url))

//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
//            if let urlContent = data {
//                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
//                dispatch_async(dispatch_get_main_queue(), {
//                    self.webView.loadHTMLString(String(webContent), baseURL: nil)
//                })
//            } else {
//                
//            }
//        }
//        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

