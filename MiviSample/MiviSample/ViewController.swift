//
//  ViewController.swift
//  MiviSample
//
//  Created by Santharao on 07/05/18.
//  Copyright © 2018 Santharao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
@IBOutlet weak var txtUName: UITextField!
@IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }

    @IBAction func btnContinueTapped(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SubscriptionInfoVC") as! SubscriptionInfoVC
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

