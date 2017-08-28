//
//  WelcomeViewController.swift
//  Musician
//
//  Created by John Detjen on 6/22/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import SafariServices

class WelcomeViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var musicianLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var musicianLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var musicianLabel: UILabel!
    @IBOutlet weak var musicianLabelTop: NSLayoutConstraint!
    @IBOutlet weak var privacyBottom: NSLayoutConstraint!
    @IBOutlet weak var signUpButtonLeading: NSLayoutConstraint!
    @IBOutlet weak var signUpButtonTrailing: NSLayoutConstraint!
    @IBOutlet weak var logInButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var signUpButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var logInButtonLeading: NSLayoutConstraint!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var logInButtonTrailing: NSLayoutConstraint!
    @IBOutlet weak var logInButtonTop: NSLayoutConstraint!
    @IBOutlet weak var privacyTop: NSLayoutConstraint!
    @IBOutlet weak var touringLabelTop: NSLayoutConstraint!
    @IBOutlet weak var startTouringLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //iPad Pro 12.9
        if view.frame.width == 1024 {
            signUpButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 40)
            loginButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 40)
            logInButtonHeight.constant = 90
            signUpButtonHeight.constant = 90
            logInButtonLeading.constant = 70
            logInButtonTrailing.constant = 70
            signUpButtonLeading.constant = 70
            signUpButtonTrailing.constant = 70
            logInButtonTop.constant = 50
            privacyTop.constant = 30
            privacyBottom.constant = 60
            privacyButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 18)
            startTouringLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 60)
            musicianLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 50)
            musicianLabelHeight.constant = 50
        }
        
        //iPad Pro 10.5
        if view.frame.width == 834 {
            signUpButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 25)
            loginButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 25)
            logInButtonHeight.constant = 70
            signUpButtonHeight.constant = 70
            logInButtonLeading.constant = 60
            logInButtonTrailing.constant = 60
            signUpButtonLeading.constant = 60
            signUpButtonTrailing.constant = 60
            logInButtonTop.constant = 40
            privacyTop.constant = 30
            privacyBottom.constant = 40
            privacyButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 18)
            startTouringLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 45)
            musicianLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 35)
            musicianLabelHeight.constant = 50
        }
        
        //iPad Air, 5th Gen
        if view.frame.width == 768 {
            signUpButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 25)
            loginButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 25)
            logInButtonHeight.constant = 65
            signUpButtonHeight.constant = 65
            logInButtonLeading.constant = 60
            logInButtonTrailing.constant = 60
            signUpButtonLeading.constant = 60
            signUpButtonTrailing.constant = 60
            logInButtonTop.constant = 40
            privacyTop.constant = 30
            privacyBottom.constant = 40
            privacyButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 18)
            startTouringLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 45)
            musicianLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 40)
            musicianLabelHeight.constant = 50
        }
        
        //iphone 5
        if view.frame.width == 320 {
            signUpButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 16)
            loginButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 16)
            logInButtonHeight.constant = 45
            signUpButtonHeight.constant = 45
            logInButtonLeading.constant = 15
            logInButtonTrailing.constant = 15
            signUpButtonLeading.constant = 15
            signUpButtonTrailing.constant = 15
            logInButtonTop.constant = 18
            privacyTop.constant = 10
            privacyBottom.constant = 5
            privacyButton.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 11)
            startTouringLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 25)
            musicianLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
            musicianLabelHeight.constant = 50
            musicianLabelTop.constant = 5
            musicianLabelLeading.constant = 5
        }
        


        
        // rounded buttons
        signUpButton.layer.cornerRadius = 5
        signUpButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func privacyPolicyButtonPressed(_ sender: Any) {
        // musician and privacy link
        if let url = URL(string: "http://www.joinmusician.com/privacypolicy") {
            let svc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            self.present(svc, animated: true, completion: nil)
        }
    }
}
