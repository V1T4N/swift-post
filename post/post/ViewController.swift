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

    
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func postbutton(_ sender: Any) {          //ボタンを押した時の動作
        var t = textField.text!                        //！をつけないとoptional型になる
        
        let parameters:[String: Any] = [              //サーバにPOSTするデータ
            "data":t
         ]
         
         Alamofire.request("http://localhost/r.php", method: .post ,parameters: parameters) //HTTPリクエスト
    
    
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

