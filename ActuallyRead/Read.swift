//
//  Read.swift
//  ActuallyRead
//
//  Created by Ronak Shah on 8/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import Foundation
import SwiftSoup

/// Returns a HTML String of the actual article content
func read(url: String) -> Article {
    // default to nytimes
    guard let url = URL(string: url) else {
        return Article(title: "Invalid URL", content: [])
    }
    
    do {
        let html = try String(contentsOf: url, encoding: .ascii)
        
        // do parsing
        
        //            guard let string = try? SwiftSoup.clean(html, Whitelist.basic()) else { return }
        let doc: Document = try SwiftSoup.parse(html)
        // try to get the title
        var title: Element! = nil
        
        title = try doc.select(".css-1j5ig2m.e1h9rw200").first()
        if (title == nil) {
            title = try doc.select(".css-fnr6md.e1h9rw200").first()
        }
        
        // try to get the article content
        let contents = try doc.select(".css-exrw3m.evys1bk0")
        var article = Article(title: (title != nil) ? try title.text() : "NY Times Article", content: [])
        for content in contents {
            article.content.append(try content.text())
        }
        
        return article
        
        
    } catch let err {
        print(err)
        return Article(title: "Error parsing: \(err)", content: [])
    }
}



struct Article {
    var title: String
    var content: [String]
}
