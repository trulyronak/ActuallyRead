//
//  ShareViewController.swift
//  ParseArticleOnline
//
//  Created by Ronak Shah on 8/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import UIKit
import Social
import WebKit

class ShareViewController: SLComposeServiceViewController {

    @IBOutlet weak var webView: WKWebView!
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
//        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
//            if let itemProvider = item.attachments?.first {
//                if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
//                    itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (url, error) -> Void in
//                        if let shareURL = url as? NSURL {
//                            // send url to server to share the link
//
//                            let html = read(url: shareURL.absoluteString!)
//                            self.webView.loadHTML(fromString: html)
//                            
//                        }
//                    })
//                }
//            }
//        }
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
