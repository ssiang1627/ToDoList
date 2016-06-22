//
//  FirstViewController.swift
//  ToDoList
//
//  Created by mac on 2016/4/19.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit


var tasks = [String]()
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var listTableView: UITableView!
    @IBOutlet var addTasksReminder: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("tasks") != nil {
            tasks = NSUserDefaults.standardUserDefaults().objectForKey("tasks") as! Array
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        listTableView.reloadData()
        if tasks.count == 0{
            addTasksReminder.hidden = false
        }else{
            addTasksReminder.hidden = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: "arial", size: 24)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        listTableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            tasks.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(tasks, forKey: "tasks")
            listTableView.reloadData()
            if tasks.count == 0{
                addTasksReminder.hidden = false
            }else{
                addTasksReminder.hidden = true
            }
        }
    }
}

