//
//  ArticleVC.swift
//  ActuallyRead
//
//  Created by Ronak Shah on 8/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import UIKit

class ArticleVC: UIViewController {

    var articleContent: Article!
    
    @IBOutlet weak var titleView: UITextView!
    @IBOutlet weak var contentView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if articleContent != nil {
            if articleContent.title == "" {
                articleContent.title = "NY Times Article"
            }
            titleView.text = articleContent.title
            contentView.text = ""
            for paragraph in articleContent.content {
                contentView.text += "\(paragraph)\n\n"
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
