//
//  Article.swift
//  AntonM2021_Example
//
//  Created by MSQUARDIAN on 8/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import CoreData

public class Article: NSManagedObject {
  
  // MARK: - Internal Properties
  
	public var title: String? = ""
	public var content: String? = ""
	public var language: String? = ""
	public var image: NSData? = nil
	public var creationDate: NSDate? = nil
	public var modificationDate: NSDate? = nil

	override public var description: String {
    return "description not implemented yet"
  }
}
