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
    
    var uuidString:String = "a"
    
    @IBOutlet weak var idtextfield: UITextField!
    @IBOutlet weak var passtextfield: UITextField!
    
   
    @IBAction func save(_ sender: Any) {            //保存ボタンを押した時の動作
    
        let userDefaults = UserDefaults.standard
        UserDefaults.standard.set(uuidString, forKey: "UUID")
        UserDefaults.standard.set(passtextfield.text, forKey: "PASS")
        userDefaults.synchronize()
        
    }
    
    
    @IBAction func getuuid(_ sender: Any) { //UUID取得ボタンを押した時の動作
    
        uuidString = UUID().uuidString //UUID生成
        
        idtextfield.text = uuidString //idtextfieldを更新
    }
    
    
    
    
    
    
    @IBAction func postbutton(_ sender: Any) {          //ボタンを押した時の動作
       
        
        
        let sharedDefaults: UserDefaults = UserDefaults(suiteName: self.suiteName)!    //ここよくわかってない
        if let url = sharedDefaults.object(forKey: self.keyName) as? String {
            
            
            
            let data:[String:String] = [              // サーバにPOSTするデータ(id,url)
                "id":uuidString,                        //uidtextfield.text!,
                "pass":passtextfield.text!,
                "url":url
                
            ]

            Alamofire.request("http://localhost/r2.php", method: .post ,parameters: data) //HTTPリクエスト
            
      
            sharedDefaults.removeObject(forKey: self.keyName) //削除
        
    
        }
        
    }
    
    
    override func viewDidLoad() { //アプリがメモリ上に読み込まれた時に実行される関数
        super.viewDidLoad()
        
         idtextfield.text = UserDefaults.standard.string(forKey: "UUID") //UserDefaultsに保存されたUUIDとPASSをtextfieldに表示
         passtextfield.text = UserDefaults.standard.string(forKey: "PASS")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

