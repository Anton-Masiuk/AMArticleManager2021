//
//  ArticleManager.swift
//  AntonM2021_Example
//
//  Created by MSQUARDIAN on 8/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

//import Foundation
import CoreData

// MARK: - Article Manager

class ArticleManager: NSManagedObject {
  
  // MARK: - Private Properties
  
  private var articles: [Article] = []
  
  // MARK: - Internal Methods
  
  internal func newArticle(title: String, content: String, language: String, image: NSData?) -> Article {
    let newArticle = Article()
    newArticle.title = title
    newArticle.content = content
    newArticle.language = language
    if let image = image {
      newArticle.image = image
    }
    newArticle.creationDate = NSDate()
    newArticle.modificationDate = NSDate()
    
    articles.append(newArticle)
    return newArticle
  }
  
  internal func getAllArticles() -> [Article] {
    return articles
  }
  
  internal func getArticles(with lang: String) -> [Article] {
    return articles.filter { $0.language == lang }
  }
  
  internal func getArticles(contain str: String) -> [Article] {
    return articles.filter {
      $0.content?.contains(str) ?? false
    }
  }
  
  internal func remove(article: Article) {
    articles = articles.filter { $0 != article}
  }
}
