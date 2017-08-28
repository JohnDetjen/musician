//
//  LogInViewController.swift
//  Musician
//
//  Created by John Detjen on 6/21/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class LogInViewController: UIViewController {
    @IBOutlet weak var textUsername: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var logInLabel: UILabel!
    @IBOutlet weak var newUserLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var passwordTextFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var emailTextFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var backButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var logInViewTop: NSLayoutConstraint!
    @IBOutlet weak var logInViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var logInViewLeading: NSLayoutConstraint!
    @IBOutlet weak var logInButtonBottom: NSLayoutConstraint!
    @IBOutlet weak var backButtonTop: NSLayoutConstraint!
    @IBOutlet weak var backButtonLeading: NSLayoutConstraint!
    @IBOutlet weak var logInButtonTop: NSLayoutConstraint!
    @IBOutlet weak var emailTextFieldBottom: NSLayoutConstraint!
    @IBOutlet weak var logInLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var logInLabelBottom: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //iPad Pro 12.9
        if view.frame.width == 1024 {
            loginButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 40)
            emailTextFieldHeight.constant = 90
            passwordTextFieldHeight.constant = 90
            logInLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 60)
            newUserLabel.font = UIFont(name: "Gilroy-Light", size: 30)
            signUpButton.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 30)
            logInButtonHeight.constant = 90
            textUsername.font = UIFont(name: "Gilroy-Light", size: 35)
            textPassword.font = UIFont(name: "Gilroy-Light", size: 35)
            logInViewTop.constant = 200
            logInViewLeading.constant = 60
            logInViewTrailing.constant = 60
            emailTextFieldBottom.constant = 25
            logInButtonTop.constant = 50
            logInButtonBottom.constant = 40
            logInLabelBottom.constant = 40
            logInLabelHeight.constant = 100
    
        }
        
        //iPad Pro 10.5
        if view.frame.width == 834 {
            loginButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 25)
            emailTextFieldHeight.constant = 70
            passwordTextFieldHeight.constant = 70
            logInLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 45)
            newUserLabel.font = UIFont(name: "Gilroy-Light", size: 25)
            signUpButton.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 25)
            logInButtonHeight.constant = 70
            textUsername.font = UIFont(name: "Gilroy-Light", size: 25)
            textPassword.font = UIFont(name: "Gilroy-Light", size: 25)
            logInViewTop.constant = 140
            logInViewLeading.constant = 60
            logInViewTrailing.constant = 60
            emailTextFieldBottom.constant = 25
            logInButtonTop.constant = 50
            logInButtonBottom.constant = 40
            logInLabelBottom.constant = 40
            logInLabelHeight.constant = 100
            
        }
        
        //iPad Air
        if view.frame.width == 768 {
            loginButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 25)
            emailTextFieldHeight.constant = 65
            passwordTextFieldHeight.constant = 65
            logInLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 45)
            newUserLabel.font = UIFont(name: "Gilroy-Light", size: 25)
            signUpButton.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 25)
            logInButtonHeight.constant = 65
            textUsername.font = UIFont(name: "Gilroy-Light", size: 25)
            textPassword.font = UIFont(name: "Gilroy-Light", size: 25)
            logInViewTop.constant = 140
            logInViewLeading.constant = 60
            logInViewTrailing.constant = 60
            emailTextFieldBottom.constant = 25
            logInButtonTop.constant = 50
            logInButtonBottom.constant = 40
            logInLabelBottom.constant = 40
            logInLabelHeight.constant = 100
            
        }

        
        
        // rounded buttons
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true
        loginView.layer.cornerRadius = 5
        loginView.clipsToBounds = true
        
        // dismiss keyboard when tapping outside view
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        setupViewResizerOnKeyboardShown()

    }

    // alert
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
 
    // open keyboard
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


    // login function
    @IBAction func login(_ sender: Any) {
        // Retrieving the info from the text fields
        if let username = textUsername.text,
            let password = textPassword.text {
        
            // Defining the user object
            MBProgressHUD.showAdded(to: view, animated: true)
            PFUser.logInWithUsername(inBackground: username, password: password, block: {(user, error) -> Void in
                if let errorString = (error as NSError?)?.userInfo["error"] as? NSString {
                    self.alert(message: errorString, title: "Error")
                }
                else {
                    self.navigationController?.dismiss(animated: true, completion: nil)
                    self.alert(message: "Welcome back!", title: "Login")
                    
                }
                MBProgressHUD.hide(for: self.view, animated: true)
            })
        }
    }
    
}
