//
//  EnterLinkVC
//  ActuallyRead
//
//  Created by Ronak Shah on 8/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import UIKit
import SwiftSoup

class EnterLinkVC: UIViewController {

    @IBOutlet weak var articleLinkTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func readArticle(_ sender: UIButton) {
        let html = read(url: articleLinkTextField.text!)
    
        let article = self.storyboard?.instantiateViewController(withIdentifier: "ArticleVC") as! ArticleVC
        article.articleContent = html
        self.navigationController?.pushViewController(article, animated: true)
    }
}

