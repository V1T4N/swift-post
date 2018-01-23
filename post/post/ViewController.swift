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
    
    var uuidString = ""
    var pass = ""
    
    
    @IBOutlet weak var idlabel: UILabel!
    
    @IBAction func postbutton(_ sender: Any) {          //ボタンを押した時の動作
       
        
        
        let sharedDefaults: UserDefaults = UserDefaults(suiteName: self.suiteName)!    //ここよくわかってない
        if let url = sharedDefaults.object(forKey: self.keyName) as? String {
            
            
            
            let data:[String:String] = [              // サーバにPOSTするデータ(id,url)
                "id":uuidString,                        //uidtextfield.text!,
                "pass":pass,
                "url":url
                
            ]

            Alamofire.request("http://localhost/r2.php", method: .post ,parameters: data) //HTTPリクエスト
            
      
            sharedDefaults.removeObject(forKey: self.keyName) //削除
        
    
        }
        
    }
    
    
    override func viewDidLoad() { //アプリがメモリ上に読み込まれた時に実行される関数
        super.viewDidLoad()
        
        
         uuidString = UserDefaults.standard.string(forKey: "UUID")!//UserDefaultsに保存されたUUIDとPASSをtextfieldに表示
         pass = UserDefaults.standard.string(forKey: "PASS")!
         idlabel.text = uuidString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

