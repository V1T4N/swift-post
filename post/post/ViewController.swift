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
    
    
    
    @IBOutlet weak var idtextfield: UITextField!
    @IBOutlet weak var passtextfield: UITextField!
    
    @IBAction func postbutton(_ sender: Any) {          //ボタンを押した時の動作
       
        
        
        let sharedDefaults: UserDefaults = UserDefaults(suiteName: self.suiteName)!
        if let url = sharedDefaults.object(forKey: self.keyName) as? String {
            // Safari を起動してそのURLに飛ぶ
            //UIApplication.shared.open(URL(string: url)!)
            
            
            let data:[String:String] = [              // サーバにPOSTするデータ(id,url)
                "id":idtextfield.text!,
                "pass":passtextfield.text!,
                "url":url
                
            ]

            Alamofire.request("http://localhost/r2.php", method: .post ,parameters: data) //HTTPリクエスト
            
            
            
            
            
            
            
            
            
            // データの削除
            sharedDefaults.removeObject(forKey: self.keyName)
        
    
        }
        
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

