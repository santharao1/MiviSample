//
//  SubscriptionInfoVC.swift
//  MiviSample
//
//  Created by Santharao on 07/05/18.
//  Copyright © 2018 Santharao. All rights reserved.
//

import UIKit
import Alamofire

class SubscriptionInfoVC: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    //var resultsData: [String]()
  
    var arrayFinal =  [Any]()
    var resultsData = Dictionary<String, Any>()

    
    let cellReuseIdentifier = "cell"
    @IBOutlet var tableViewData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewData.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        Alamofire.request("https://gitlab.com/mfebrianto/mivi-ios-android-test/raw/master/collection.json", method: .get, parameters: ["":""], encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result)
            {
            case .success(let JSON):
                if response.result.value != nil
                {
                  //  print("Success with JSON: \(JSON)")
                    
                    let response1 = JSON as! NSDictionary
                  
                    if let reso = response1["included"]
                    {
                     
                        
                        var arrayFinal1 =  (reso as! NSArray) as! [Any]

                        for i in(0...arrayFinal1.count-1)
                        {
                            let item = arrayFinal1[i] as! NSDictionary
                           let new = item["type"] as! String
                            if(new == "subscriptions")
                            {
                                
                                self.arrayFinal = [arrayFinal1[i]]
                            }
                            
                        }
                        
                        
                        print( self.arrayFinal)
                        self.tableViewData.reloadData()
                    }
                    
                   

                    
                    
                    
                 //   self.resultsData = response.result.value!["included"] as! [String : Any]
                    
                  //  resultsData = response.result.value
                }
                break
                
            case .failure(_):
                print(response.result.error as Any)
                break
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayFinal.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let item = self.arrayFinal[indexPath.row] as! NSDictionary
      // let  item1 = item["attributes"] as! NSDictionary

        
        cell.textLabel?.text = item["id"] as? String
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
