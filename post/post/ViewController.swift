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
    let suiteName: String = "group.com.test.post"
    let keyName: String = "shareData"
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func postbutton(_ sender: Any) {          //ボタンを押した時の動作
        /* var t = textField.text!                        //！をつけないとoptional型になる
        
        let parameters:[String: Any] = [              //サーバにPOSTするデータ
            "data":t
         ]
         
         Alamofire.request("http://localhost/r.php", method: .post ,parameters: parameters) //HTTPリクエスト
    */
        
        
        let sharedDefaults: UserDefaults = UserDefaults(suiteName: self.suiteName)!
        if let url = sharedDefaults.object(forKey: self.keyName) as? String {
            // Safari を起動してそのURLに飛ぶ
            //UIApplication.shared.open(URL(string: url)!)
            
            
            let parameters:[String: Any] = [              //サーバにPOSTするデータ
                "data":url
            ]
            
            Alamofire.request("http://localhost/r.php", method: .post ,parameters: parameters) //HTTPリクエスト
            textField.text = url
            
            // データの削除
            sharedDefaults.removeObject(forKey: self.keyName)
        
    
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      /*  let sharedDefaults: UserDefaults = UserDefaults(suiteName: self.suiteName)!
        if let url = sharedDefaults.object(forKey: self.keyName) as? String {
            // Safari を起動してそのURLに飛ぶ
            //UIApplication.shared.open(URL(string: url)!)
            
            
            let parameters:[String: Any] = [              //サーバにPOSTするデータ
                "data":url
            ]
            
            Alamofire.request("http://localhost/r.php", method: .post ,parameters: parameters) //HTTPリクエスト
            textField.text = url
            
            // データの削除
            sharedDefaults.removeObject(forKey: self.keyName)
        } */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

