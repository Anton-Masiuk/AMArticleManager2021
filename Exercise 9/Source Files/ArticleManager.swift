//
//  ArticleManager.swift
//  AntonM2021_Example
//
//  Created by MSQUARDIAN on 8/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Article Manager

public class ArticleManager {
  
	// MARK: - Public Properties
	
	public static let shared = ArticleManager()
	
  // MARK: - Private Properties
  
  private var articles: [Article] = []
	private let container = NSPersistentContainer(name: "Article")
	private var managedObjectContext: NSManagedObjectContext?
	
	private lazy var persistentContainer: NSPersistentContainer? = {
		let modelURL = Bundle(for: ArticleManager.self).url(forResource: "Article", withExtension: "momd")
		
		guard let model = modelURL.flatMap(NSManagedObjectModel.init) else {
			print("Fail to load the trigger model!")
			return nil
		}
		
		var container = NSPersistentContainer(name: "Article", managedObjectModel: model)
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				print("Unresolved error \(error), \(error.userInfo)")
			}
		})
		
		return container
	}()
	
	// MARK: - Public Initializers
	
	public init?() {
		managedObjectContext = persistentContainer?.viewContext
		
		guard managedObjectContext != nil else {
			print("Cann't get right managed object context.")
			return nil
		}
	}
	
  // MARK: - Public Methods
	
	public func newArticle(title: String, content: String, language: String, image: Data?) -> Article? {
		if let managedObjectContext = managedObjectContext {
			let entity = NSEntityDescription.entity(forEntityName: "Article", in: managedObjectContext)!
			let article = NSManagedObject(entity: entity, insertInto: managedObjectContext)
			article.setValue(title, forKeyPath: "title")
			article.setValue(content, forKey: "content")
			article.setValue("en", forKey: "language")
			article.setValue(image, forKey: "image")
			article.setValue(NSDate(), forKey: "creationDate")
			article.setValue(NSDate(), forKey: "modificationDate")
			do {
				try managedObjectContext.save()
				debugPrint(article)
			} catch let error as NSError {
				print("Could not save. \(error), \(error.userInfo)")
			}
//			articles.append(article as Article)
			return nil
		}
    return nil
  }
  
	public func getAllArticles() -> [Article] {
    return articles
  }
  
	public func getArticles(with lang: String) -> [Article] {
    return articles.filter { $0.language == lang }
  }
  
	public func getArticles(contain str: String) -> [Article] {
    return articles.filter {
      $0.content?.contains(str) ?? false
    }
  }
  
	public func remove(article: Article) {
    articles = articles.filter { $0 != article}
  }
	
	public func loadArticles() -> [Article] {
		
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
		var array: [Article] = []
		request.returnsObjectsAsFaults = false
		do {
			let result = try managedObjectContext?.fetch(request)
			for data in result as! [NSManagedObject] {
				print(data.value(forKey: "title") as! String)
				debugPrint(data.value(forKey: "content") as! String)
				if let article = data as? Article {
					array.append(article)
				}
			}
			
		} catch {
			
			print("Failed")
		}
	return array
	}
}
