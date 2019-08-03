//
//  ShareArticleViewController.swift
//  ParseArticleOnline
//
//  Created by Ronak Shah on 8/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import UIKit
import WebKit

class ShareArticleViewController: UIViewController {

    @IBOutlet weak var titleView: UITextView!
    @IBOutlet weak var paragraphView: UITextView!
    
    
    @IBAction func backToWebpage(_ sender: Any) {
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = item.attachments?.first {
                if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                    itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (url, error) -> Void in
                        if let shareURL = url as? NSURL {
                            // send url to server to share the link
                            
                            let article = read(url: shareURL.absoluteString!)
                            self.paragraphView.text = ""
                            self.titleView.text = article.title
                            for para in article.content {
                                self.paragraphView.text += "\(para)\n\n"
                            }
                        }
                    })
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
