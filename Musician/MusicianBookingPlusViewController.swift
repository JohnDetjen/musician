//
//  MusicianBookingPlusViewController.swift
//  Musician
//
//  Created by John Detjen on 7/7/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import StoreKit

class MusicianBookingPlusViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    @IBOutlet weak var musicianBookingPlus: UIButton!
    @IBOutlet weak var restoreButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        musicianBookingPlus.isEnabled = false
        restoreButton.isEnabled = false
        
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
                buyProduct()
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
                print("musician booking plus")
                
            default:
                print("IAP not found")
                
            }
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("add payment")
        
        for transaction: AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            print(trans.error)
            
            switch trans.transactionState {
            case .purchased:
                print("buy ok, unlock IAP here")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier
                switch prodID {
                case "MusicianBookingPlus":
                    print("musician booking plus")
                    
                default:
                    print("IAP not found")
                }
                queue.finishTransaction(trans)
            case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                break
            default:
                print("Default")
                break
            }
        }
    }
    
    
}



