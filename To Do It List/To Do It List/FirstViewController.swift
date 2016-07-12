//
//  FirstViewController.swift
//  To Do It List
//
//  Created by keivn c on 7/7/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

var justDoItList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var toDoItListTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("justDoItList") != nil {
            justDoItList = NSUserDefaults.standardUserDefaults().objectForKey("justDoItList") as! [String]
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return justDoItList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = justDoItList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            justDoItList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(justDoItList, forKey: "justDoItList")
            toDoItListTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        toDoItListTable.reloadData()
    }

}

