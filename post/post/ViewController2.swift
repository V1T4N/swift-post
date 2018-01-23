//
//  ViewController2.swift
//  post
//
//  Created by YuzukiMimura on 2018/01/23.
//  Copyright © 2018年 YuzukiMimura. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var uuidString:String = "a"
   
    @IBOutlet weak var idtextfield: UITextField!
    @IBOutlet weak var passtextfield: UITextField!
    
    
    @IBAction func getUUID(_ sender: Any) {//UUID取得ボタンを押した時の動作
    
        uuidString = UUID().uuidString //UUID生成
    
        idtextfield.text = uuidString //idtextfieldを更新
    
    }
    
    
    
    @IBAction func save(_ sender: Any) {//保存ボタンを押した時の動作
    
        let userDefaults = UserDefaults.standard
        UserDefaults.standard.set(uuidString, forKey: "UUID")
        UserDefaults.standard.set(passtextfield.text, forKey: "PASS")
        userDefaults.synchronize()
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
