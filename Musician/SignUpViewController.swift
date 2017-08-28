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
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var signUpLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textUsernameHeight: NSLayoutConstraint!
    @IBOutlet weak var textPasswordHeight: NSLayoutConstraint!
    @IBOutlet weak var textBandNameHeight: NSLayoutConstraint!
    @IBOutlet weak var textBandWebsiteHeight: NSLayoutConstraint!
    @IBOutlet weak var textBandHometownHeight: NSLayoutConstraint!
    @IBOutlet weak var doneButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var textInfoLabel: UILabel!
    @IBOutlet weak var logInView: UIView!
    @IBOutlet weak var alreadyHaveTextLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logInViewTop: NSLayoutConstraint!
    @IBOutlet weak var logInViewBottom: NSLayoutConstraint!
    @IBOutlet weak var textViewBottom: NSLayoutConstraint!
    @IBOutlet weak var logInViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var logInViewLeading: NSLayoutConstraint!
    @IBOutlet weak var textUsernameTop: NSLayoutConstraint!
    @IBOutlet weak var textPasswordTop: NSLayoutConstraint!
    @IBOutlet weak var textInfoTop: NSLayoutConstraint!
    @IBOutlet weak var textNameTop: NSLayoutConstraint!
    @IBOutlet weak var textWebsiteTop: NSLayoutConstraint!
    @IBOutlet weak var textHometownTop: NSLayoutConstraint!
    @IBOutlet weak var doneButtonBottom: NSLayoutConstraint!
    @IBOutlet weak var doneButtonTop: NSLayoutConstraint!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //iPad Pro 12.9
        if view.frame.width == 1024 {
            doneButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 40)
            textUsernameHeight.constant = 90
            textPasswordHeight.constant = 90
            textBandNameHeight.constant = 90
            textBandWebsiteHeight.constant = 90
            textBandHometownHeight.constant = 90
            signUpLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 60)
            alreadyHaveTextLabel.font = UIFont(name: "Gilroy-Light", size: 30)
            textInfoLabel.font = UIFont(name: "Gilroy-Light", size: 30)
            logInButton.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 30)
            doneButtonHeight.constant = 90
            textUsername.font = UIFont(name: "Gilroy-Light", size: 35)
            textPassword.font = UIFont(name: "Gilroy-Light", size: 35)
            textBandName.font = UIFont(name: "Gilroy-Light", size: 35)
            textBandHometown.font = UIFont(name: "Gilroy-Light", size: 35)
            textBandWebsite.font = UIFont(name: "Gilroy-Light", size: 35)
            logInViewTop.constant = 200
            logInViewLeading.constant = 60
            logInViewTrailing.constant = 60
            textPasswordTop.constant = 25
            textInfoTop.constant = 35
            textNameTop.constant = 25
            textPasswordTop.constant = 25
            textWebsiteTop.constant = 25
            textHometownTop.constant = 25
            doneButtonTop.constant = 50
            doneButtonBottom.constant = 40
            textUsernameTop.constant = 40
            signUpLabelHeight.constant = 100
            
        }
        
        //iPad Pro 10.5
        if view.frame.width == 834 {
            doneButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 25)
            textUsernameHeight.constant = 70
            textPasswordHeight.constant = 70
            textBandNameHeight.constant = 70
            textBandWebsiteHeight.constant = 70
            textBandHometownHeight.constant = 70
            signUpLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 45)
            alreadyHaveTextLabel.font = UIFont(name: "Gilroy-Light", size: 25)
            textInfoLabel.font = UIFont(name: "Gilroy-Light", size: 25)
            logInButton.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 25)
            doneButtonHeight.constant = 70
            textUsername.font = UIFont(name: "Gilroy-Light", size: 25)
            textPassword.font = UIFont(name: "Gilroy-Light", size: 25)
            textBandName.font = UIFont(name: "Gilroy-Light", size: 25)
            textBandHometown.font = UIFont(name: "Gilroy-Light", size: 25)
            textBandWebsite.font = UIFont(name: "Gilroy-Light", size: 25)
            logInViewTop.constant = 140
            logInViewLeading.constant = 60
            logInViewTrailing.constant = 60
            textPasswordTop.constant = 25
            textInfoTop.constant = 35
            textNameTop.constant = 25
            textPasswordTop.constant = 25
            textWebsiteTop.constant = 25
            textHometownTop.constant = 25
            doneButtonTop.constant = 50
            doneButtonBottom.constant = 40
            textUsernameTop.constant = 40
            signUpLabelHeight.constant = 100
            
        }
        
        //iPad Air
        if view.frame.width == 768 {
            doneButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 25)
            textUsernameHeight.constant = 65
            textPasswordHeight.constant = 65
            textBandNameHeight.constant = 65
            textBandWebsiteHeight.constant = 65
            textBandHometownHeight.constant = 65
            signUpLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 45)
            alreadyHaveTextLabel.font = UIFont(name: "Gilroy-Light", size: 25)
            textInfoLabel.font = UIFont(name: "Gilroy-Light", size: 20)
            logInButton.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 25)
            doneButtonHeight.constant = 65
            textUsername.font = UIFont(name: "Gilroy-Light", size: 25)
            textPassword.font = UIFont(name: "Gilroy-Light", size: 25)
            textBandName.font = UIFont(name: "Gilroy-Light", size: 25)
            textBandHometown.font = UIFont(name: "Gilroy-Light", size: 25)
            textBandWebsite.font = UIFont(name: "Gilroy-Light", size: 25)
            logInViewTop.constant = 130
            logInViewLeading.constant = 60
            logInViewTrailing.constant = 60
            textPasswordTop.constant = 25
            textInfoTop.constant = 35
            textNameTop.constant = 25
            textPasswordTop.constant = 25
            textWebsiteTop.constant = 25
            textHometownTop.constant = 25
            doneButtonTop.constant = 50
            doneButtonBottom.constant = 40
            textUsernameTop.constant = 40
            signUpLabelHeight.constant = 100
            
        }

        

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
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        guard let username = textUsername.text, let password = textPassword.text, textUsername.text?.isEmpty == false, textPassword.text?.isEmpty == false else {
            self.alert(message: "Please enter an email and password", title: "Error")
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
            MBProgressHUD.hide(for: self.view, animated: true)

            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                self.alert(message: errorString!, title: "Error")
                
            } else {
                //self.alert(message: "Registered successfully", title: "Registering")
                self.navigationController?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    
}
