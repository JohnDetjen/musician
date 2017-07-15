//
//  SignUpViewController.swift
//  Musician
//
//  Created by John Detjen on 6/22/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import SCLAlertView
import MBProgressHUD

class SignUpViewController: UIViewController {
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var textUsername: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textBandName: UITextField!
    @IBOutlet weak var textBandWebsite: UITextField!
    @IBOutlet weak var textBandHometown: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!


    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.layer.cornerRadius = 5
        loginView.clipsToBounds = true
        doneButton.layer.cornerRadius = 5
        doneButton.clipsToBounds = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
        setupViewResizerOnKeyboardShown()
    }
    
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

    
    func setupViewResizerOnKeyboardShown() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShowForResizing),
                                               name: Notification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHideForResizing),
                                               name: Notification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    func keyboardWillShowForResizing(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollViewBottomConstraint.constant = keyboardSize.height
        } else {
            debugPrint("We're showing the keyboard and either the keyboard size or window is nil: panic widely.")
        }
    }
    
    func keyboardWillHideForResizing(notification: Notification) {
        scrollViewBottomConstraint.constant = 0
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        guard let username = textUsername.text, let password = textPassword.text else {
            self.alert(message: "Please enter an email and password", title: "Fail")
            return
        }
        
        let user = PFUser()
        user.username = username
        user.password = password
        
        // Retrieving the info from the text field
        if let bandName = textBandName.text {
            user["bandName"] = bandName
        }
        if let website = textBandWebsite.text {
            user["website"] = website
        }
        if let hometown = textBandHometown.text {
            user["hometown"] = hometown
        }
        
        // Defining the user object
        
        
        // We won't set the email for this example;
        // Just for simplicity
        
        // Signing up using the Parse API
        MBProgressHUD.showAdded(to: view, animated: true)
        user.signUpInBackground {
            (success, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                self.alert(message: errorString!, title: "Error")
                
            } else {
                self.alert(message: "Registered successfully", title: "Registering")
                self.navigationController?.dismiss(animated: true, completion: nil)
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    
    
}
