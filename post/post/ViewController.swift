//
//  ViewController.swift
//  post
//
//  Created by YuzukiMimura on 2017/12/27.
//  Copyright © 2017年 YuzukiMimura. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBAction func postbutton(_ sender: Any) {
    
          let parameters:[String: Any] = [
         "data": 1
         ]
         
         Alamofire.request("http://localhost/r.php", method: .post ,parameters: parameters)
         
         
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

