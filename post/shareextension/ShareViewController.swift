//
//  ShareViewController.swift
//  shareextension
//
//  Created by YuzukiMimura on 2017/12/29.
//  Copyright © 2017年 YuzukiMimura. All rights reserved.
//

import UIKit
import Social
import Alamofire

class ShareViewController: SLComposeServiceViewController {
    
    
    let suiteName: String = "group.com.test.post"
    let keyName: String = "shareData"

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        
       
        
        
        let inputItem: NSExtensionItem = self.extensionContext?.inputItems[0] as! NSExtensionItem
        let itemProvider = inputItem.attachments![0] as! NSItemProvider
        
        // Safari 経由での shareExtension では URL を取得
        if (itemProvider.hasItemConformingToTypeIdentifier("public.url")) {
            itemProvider.loadItem(forTypeIdentifier:"public.url", options: nil, completionHandler: {
                (item, error) in
                
                // NSURLを取得する
                if let url: NSURL = item as? NSURL {
                    
                    
    
                    
                   
                    
                    // ----------
                    // 保存処理
                    // ----------
                    let sharedDefaults: UserDefaults = UserDefaults(suiteName: self.suiteName)!
                    sharedDefaults.set(url.absoluteString!, forKey: self.keyName)  // そのページのURL保存
                    sharedDefaults.synchronize()
                }
            })
        }
        
        
       
        
        
        self.extensionContext!.completeRequest(returningItems:[], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
