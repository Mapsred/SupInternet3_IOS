//
//  ViewController.swift
//  My First Application
//
//  Created by SUP'Internet 07 on 19/10/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //First test
        /*
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
        view.backgroundColor = .blueColor()
        self.view.addSubview(view)
        */
        //Second test - label
        self.myLabel.text = "Hello Guys"
        self.loginField.text = "Login Field"
        self.passwordField.text = "Password Field"
        self.myButton.setTitle("Click here !", forState: .Normal)
    }
    
    @IBAction func useTouchedLoginButton() {
        
        guard let username = loginField.text,
        let password = passwordField.text where
            username.characters.count > 0 &&
            isPasswordEnoughSecured(password) == true else {
                showErrorAlert()
            return
        }
        
        print("Username[\(username)]")
        print("Password[\(password)]")
        
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "My First App", message: "Enter correct username/password", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Got it !", style: .Default, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func isPasswordEnoughSecured(pass: String) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

