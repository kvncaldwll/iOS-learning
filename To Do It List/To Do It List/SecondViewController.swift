//
//  SecondViewController.swift
//  To Do It List
//
//  Created by keivn c on 7/7/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        if item.text != nil{
            justDoItList.append(item.text!)
            item.text = ""
            NSUserDefaults.standardUserDefaults().setObject(justDoItList, forKey: "justDoItList")
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        item.resignFirstResponder()
        return true
    }


}

