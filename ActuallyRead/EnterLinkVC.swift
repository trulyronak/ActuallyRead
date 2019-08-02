//
//  EnterLinkVC
//  ActuallyRead
//
//  Created by Ronak Shah on 8/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import UIKit

class EnterLinkVC: UIViewController {

    @IBOutlet weak var articleLinkTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func readArticle(_ sender: UIButton) {
        sender.setTitle("Reading Article", for: .focused)
        // do request
        
        sender.setTitle("Parsing Article", for: .focused)
        // do parsing
        
        // transition to new vc with content
        sender.setTitle("Success! Showing Article", for: .normal)
        let article = self.storyboard?.instantiateViewController(withIdentifier: "ArticleVC") as! ArticleVC
        article.articleContent = "<h1>Functionality Not Supported :O</h1>"
        self.navigationController?.pushViewController(article, animated: true)
    }
}

