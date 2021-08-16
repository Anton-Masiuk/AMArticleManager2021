//
//  ArticleManager.swift
//  AntonM2021_Example
//
//  Created by MSQUARDIAN on 8/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import CoreData

// MARK: - Article Manager

public class ArticleManager {
  
	// MARK: - Public Properties
	
	public static let shared = ArticleManager()
	
  // MARK: - Private Properties
  
	private var managedObjectContext: NSManagedObjectContext

	// MARK: - Public Initializers
	
	public init() {
		guard let modelURL = Bundle(for: ArticleManager.self).url(forResource: "Article", withExtension: "momd"),
							let articleModel = NSManagedObjectModel(contentsOf: modelURL) else {
					fatalError("Failed to find article model resource")
				}
		let persistentContainer = NSPersistentContainer(name: "Article", managedObjectModel: articleModel)
		persistentContainer.loadPersistentStores { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError(error.localizedDescription)
			}
		}
		self.managedObjectContext = persistentContainer.viewContext
	}
	
  // MARK: - Public Methods
	
	public func newArticle(title: String, content: String, language: String, image: Data?) -> Article? {
			let entity = NSEntityDescription.entity(forEntityName: "Article", in: managedObjectContext)!
			let article = NSManagedObject(entity: entity, insertInto: managedObjectContext)
			article.setValue(title, forKeyPath: "title")
			article.setValue(content, forKey: "content")
			article.setValue("en", forKey: "language")
			article.setValue(image, forKey: "image")
			article.setValue(NSDate(), forKey: "creationDate")
			article.setValue(NSDate(), forKey: "modificationDate")
			save()
			return nil
  }
  
	public func getArticles(with lang: String) -> [Article] {
		let allArticles = getAllArticles()
    return allArticles.filter { $0.language == lang }
  }
  
	public func getArticles(contain str: String) -> [Article] {
		let allArticles = getAllArticles()
    return allArticles.filter {
      $0.content?.contains(str) ?? false
    }
  }
  
	public func remove(article: Article) {
		managedObjectContext.delete(article)
		save()
  }
	
	public func getAllArticles() -> [Article] {
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
		var array: [Article] = []
		request.returnsObjectsAsFaults = false
		do {
			let result = try managedObjectContext.fetch(request)
			for data in result as! [NSManagedObject] {
				if let article = data as? Article {
					array.append(article)
				}
			}
		} catch {
			debugPrint("Failed to load articles")
		}
	return array
	}
	
	// MARK: - Private Methods
	
	private func save() {
		do {
				try managedObjectContext.save()
		} catch let error as NSError {
			debugPrint("Failed to save changes in articles. \(error.localizedDescription)")
		}
	}
}
