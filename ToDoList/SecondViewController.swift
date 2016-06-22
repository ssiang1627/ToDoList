//
//  SecondViewController.swift
//  ToDoList
//
//  Created by mac on 2016/4/19.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    @IBAction func changeText(sender: AnyObject) {
        if myTextField.text == "" {
            addButton.setTitle("Back", forState: .Normal)
            addButton.setTitle("Back", forState: .Selected)
        }else{
            addButton.setTitle("Add", forState: .Normal)
            addButton.setTitle("Add", forState: .Selected)
            
        }
    }
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addTasks(sender: UIButton) {
        if myTextField.text != "" {
            
            tasks.append(myTextField.text!)
            NSUserDefaults.standardUserDefaults().setObject(tasks, forKey: "tasks")
            
        
        }
        myTextField.text = ""
        myTextField.resignFirstResponder()
        self.tabBarController?.selectedIndex = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewWillAppear(animated: Bool) {
        myTextField.becomeFirstResponder()
        addButton.setTitle("Back", forState: .Normal)
        addButton.setTitle("Back", forState: .Selected)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if myTextField.text != "" {
            
            tasks.append(myTextField.text!)
            NSUserDefaults.standardUserDefaults().setObject(tasks, forKey: "tasks")

            
            myTextField.text = ""
            myTextField.resignFirstResponder()
            self.tabBarController?.selectedIndex = 0

            
            
        }
        
        return true
    }
 


}

