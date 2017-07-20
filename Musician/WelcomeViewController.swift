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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 5
        signUpButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func privacyPolicyButtonPressed(_ sender: Any) {
        let svc = SFSafariViewController(url: ("www.joinmusician.com/privacypolicy" as? URL)!, entersReaderIfAvailable: true)
        self.present(svc, animated: true, completion: nil)
        
    }
}
