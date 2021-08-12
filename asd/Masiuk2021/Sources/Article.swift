//
//  Article.swift
//  AntonM2021_Example
//
//  Created by MSQUARDIAN on 8/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import CoreData

class Article: NSManagedObject {
  
  // MARK: - Internal Properties
  
  internal var title: String? = ""
  internal var content: String? = ""
  internal var language: String? = ""
  internal var image: NSData? = nil
  internal var creationDate: NSDate? = nil
  internal var modificationDate: NSDate? = nil

  override internal var description: String {
    return "description not implemented yet"
  }
  
//  // MARK: - Private Properties
//
//  private let creationDate: NSDate? = nil
//  private let modificationDate: NSDate? = nil
//
//  // MARK: - Initialization Methods
//
//  init(title: String, content: String, language: String, image: NSData?) {
//    super.init()
//    self.title = title
//    self.content = content
//    self.language = language
//    if let image = image {
//      self.image = image
//    }
//    self.creationDate = NSDate()
//    self.modificationDate = NSDate()
//  }
}
