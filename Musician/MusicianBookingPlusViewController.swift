//
//  MusicianBookingPlusViewController.swift
//  Musician
//
//  Created by John Detjen on 7/7/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import StoreKit
import SafariServices
import SwiftyStoreKit

class MusicianBookingPlusViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    var screenSize = CGRect.zero
    @IBOutlet weak var musicianBookingPlus: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    @IBOutlet weak var getPlusButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var getPlusButtonFromBottom: NSLayoutConstraint!
    
    @IBOutlet weak var getPlusViewLeading: NSLayoutConstraint!
    @IBOutlet weak var getPlusViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var getPlusButtonLeading: NSLayoutConstraint!
    @IBOutlet weak var getPlusButtonTrailing: NSLayoutConstraint!
    @IBOutlet weak var closeButtonWidth: NSLayoutConstraint!
    
    @IBOutlet weak var freeTrialLabel: UILabel!
    @IBOutlet weak var byClickingViewTop: NSLayoutConstraint!
    @IBOutlet weak var byClickingLabel: UILabel!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var restoreButtonTop: NSLayoutConstraint!
    
    @IBOutlet weak var restoreButtonBottom: NSLayoutConstraint!
    
    @IBOutlet weak var detailsTextLabel: UILabel!
    @IBOutlet weak var andLabel: UILabel!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var andLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var deatilTextLabelTop: NSLayoutConstraint!
    
    var delegate: MusicianBookingPlusViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
        musicianBookingPlus.isEnabled = false
        restoreButton.isEnabled = false
        musicianBookingPlus.layer.cornerRadius = 5
        musicianBookingPlus.clipsToBounds = true
        
        //iPad Pro 12.9
        if view.frame.width == 1024 {
            getPlusButtonHeight.constant = 120
            musicianBookingPlus.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: UIFontWeightThin)
            restoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightThin)
            freeTrialLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
            byClickingLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
            detailsTextLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
            andLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
            andLabelHeight.constant = 18
            termsButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold)
            privacyButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold)
            getPlusButtonFromBottom.constant = -39
            getPlusViewLeading.constant = 100
            getPlusViewTrailing.constant = 100
            getPlusButtonLeading.constant = 30
            getPlusButtonTrailing.constant = -30
            closeButtonWidth.constant = 80
            deatilTextLabelTop.constant = 7
            restoreButtonTop.constant = 40
            byClickingViewTop.constant = 100
            
            
        }
        
        //iPad Pro 10.5
        if view.frame.width == 834 {
            getPlusButtonHeight.constant = 90
            musicianBookingPlus.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: UIFontWeightThin)
            restoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: UIFontWeightThin)
            freeTrialLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
            byClickingLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
            detailsTextLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
            andLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
            andLabelHeight.constant = 16
            termsButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
            privacyButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
            getPlusButtonFromBottom.constant = -35
            getPlusViewLeading.constant = 90
            getPlusViewTrailing.constant = 90
            getPlusButtonLeading.constant = 30
            getPlusButtonTrailing.constant = -30
            closeButtonWidth.constant = 60
            deatilTextLabelTop.constant = 5
            restoreButtonTop.constant = 30
            byClickingViewTop.constant = 90
        }
        
        
        // iphone 5
        if view.frame.width == 320 {
            getPlusButtonHeight.constant = 42
            musicianBookingPlus.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
            restoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
            freeTrialLabel.font = UIFont.systemFont(ofSize: 8, weight: UIFontWeightThin)
            byClickingLabel.font = UIFont.systemFont(ofSize: 8, weight: UIFontWeightThin)
            detailsTextLabel.font = UIFont.systemFont(ofSize: 8, weight: UIFontWeightThin)
            andLabel.font = UIFont.systemFont(ofSize: 8, weight: UIFontWeightThin)
            andLabelHeight.constant = 8
            termsButton.titleLabel?.font = UIFont.systemFont(ofSize: 8, weight: UIFontWeightBold)
            privacyButton.titleLabel?.font = UIFont.systemFont(ofSize: 8, weight: UIFontWeightBold)
            getPlusButtonFromBottom.constant = -18
            getPlusViewLeading.constant = 13
            getPlusViewTrailing.constant = 13
            getPlusButtonLeading.constant = 10
            getPlusButtonTrailing.constant = -10
            closeButtonWidth.constant = 40
            byClickingViewTop.constant = 30
            deatilTextLabelTop.constant = -1
            restoreButtonTop.constant = 18
        }
        

        
        // iphone 7 plus
        if view.frame.width == 414 {
            getPlusButtonHeight.constant = 60
            musicianBookingPlus.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightThin)
            restoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightThin)
            freeTrialLabel.font = UIFont.systemFont(ofSize: 10, weight: UIFontWeightThin)
            byClickingLabel.font = UIFont.systemFont(ofSize: 9, weight: UIFontWeightThin)
            termsButton.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: UIFontWeightBold)
            andLabelHeight.constant = 9
            andLabel.font = UIFont.systemFont(ofSize: 9, weight: UIFontWeightThin)
            privacyButton.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: UIFontWeightBold)
            detailsTextLabel.font = UIFont.systemFont(ofSize: 9, weight: UIFontWeightThin)
            getPlusButtonFromBottom.constant = -20
            getPlusViewLeading.constant = 13
            getPlusViewTrailing.constant = 13
            getPlusButtonLeading.constant = 12
            getPlusButtonTrailing.constant = -12
            closeButtonWidth.constant = 45
            byClickingViewTop.constant = 20
            restoreButtonTop.constant = 22
            deatilTextLabelTop.constant = 1
            byClickingViewTop.constant = 50
        }

        // ipad air
        if view.frame.width == 768 {
            getPlusButtonHeight.constant = 90
            musicianBookingPlus.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightThin)
            restoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: UIFontWeightThin)
            detailsTextLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
            freeTrialLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
            byClickingLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
            termsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold)
            andLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
            andLabelHeight.constant = 15
            privacyButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold)
            getPlusButtonFromBottom.constant = -30
            getPlusViewLeading.constant = 80
            getPlusViewTrailing.constant = 80
            getPlusButtonLeading.constant = 30
            getPlusButtonTrailing.constant = -30
            closeButtonWidth.constant = 60
            deatilTextLabelTop.constant = 6
            restoreButtonTop.constant = 30
            byClickingViewTop.constant = 80

        }
        
        if(SKPaymentQueue.canMakePayments()) {
            print("IAP is enable, loading")
            let productID: NSSet = NSSet(object: "MusicianBookingPlus")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        }
        else {
            print("please enable IAPS")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func termsOfUsePressed(_ sender: Any) {
        if let url = URL(string: "http://www.joinmusician.com/termsofuse") {
            let svc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            self.present(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func privacyButtonPressed(_ sender: Any) {
        if let url = URL(string: "http://www.joinmusician.com/privacypolicy") {
            let svc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            self.present(svc, animated: true, completion: nil)
        }
    }
    
    

    @IBAction func restorePurchasePressed(_ sender: Any) {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    @IBAction func musicianBookingPlusPressed(_ sender: Any) {
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == "MusicianBookingPlus") {
                p = product
                //buyProduct()
                purchase()
            }
        }
    }
    
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    
    var list = [SKProduct]()
    var p = SKProduct()
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("product request")
        let myProduct = response.products
        for product in myProduct {
            print("product added")
            print(product.productIdentifier)
            print(product.localizedTitle)
            print(product.localizedDescription)
            print(product.price)
            
            list.append(product)
        }
        
        musicianBookingPlus.isEnabled = true
        restoreButton.isEnabled = true

    }
 
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        print("transaction restored")
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction
            let prodID = t.payment.productIdentifier as String
            
            switch prodID {
            case "MusicianBookingPlus":
                if transaction.transactionState == .purchased {
                    print("musician booking plus")
                    UserDefaults.standard.set(true, forKey: "purchased")
                    self.delegate?.musicianBookingViewControllerDidPurchase()
                    self.dismiss(animated: true, completion: {
                    })
                }
            default:
                print("IAP not found")
                
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.delegate?.musicianBookingViewControllerDidCancel()

        self.dismiss(animated: true, completion: {
        })
    }
    
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("add payment")
        
        for transaction: AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            print(trans.error)
            
            switch trans.transactionState {
            case .purchased:
                /*print("buy ok, unlock IAP here")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier
                switch prodID {
                case "MusicianBookingPlus":
                    print("musician booking plus")
                    
                default:
                    print("IAP not found")
                }*/
                queue.finishTransaction(trans)
                UserDefaults.standard.set(true, forKey: "purchased")
                self.delegate?.musicianBookingViewControllerDidPurchase()
                self.dismiss(animated: true, completion: {
                })
                break
           /* case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                
                // USe this code for cancel button as well
                
                self.delegate?.musicianBookingViewControllerDidCancel()
                self.dismiss(animated: true, completion: {
                })
 
                break*/
 
            default:
                print("Default")
                
                break
            }
        }
    }
    
    
    func purchase() {
        SwiftyStoreKit.purchaseProduct("MusicianBookingPlus") { (result) in
            switch result {
            case .success(let product):
                if product.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
                UserDefaults.standard.set(true, forKey: "purchased")
                self.delegate?.musicianBookingViewControllerDidPurchase()
                self.dismiss(animated: true, completion: {
                })
            default:
                break;
            }
        }
    }
    
    
    
    
}

protocol MusicianBookingPlusViewControllerDelegate {
    func musicianBookingViewControllerDidCancel()
    func musicianBookingViewControllerDidPurchase()
}



