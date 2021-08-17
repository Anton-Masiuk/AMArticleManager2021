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
		guard let modelURL = Bundle(for: ArticleManager.self).url(forResource: Const.ArticleManager.articleModelName,
																															withExtension: Const.ArticleManager.momdExtension),
					let articleModel = NSManagedObjectModel(contentsOf: modelURL) else {
			fatalError(Const.ArticleManager.urlResourceFailMessage)
		}
		let persistentContainer = NSPersistentContainer(name: Const.ArticleManager.articleModelName,
																										managedObjectModel: articleModel)
		persistentContainer.loadPersistentStores { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError(error.localizedDescription)
			}
		}
		self.managedObjectContext = persistentContainer.viewContext
	}
	
	// MARK: - Public Methods
	
	public func newArticle(title: String, content: String, language: String, image: Data?) -> Article? {
		guard let article = NSEntityDescription.insertNewObject(forEntityName: Const.ArticleManager.articleModelName,
																														into: managedObjectContext) as? Article else { return nil }
		article.title = title
		article.content = content
		article.language = language
		article.image = image
		article.creationDate = Date()
		article.modificationDate = nil
		save()
		return article
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
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: Const.ArticleManager.articleModelName)
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
			debugPrint(Const.ArticleManager.loadArticlesFailMessage)
		}
		return array
	}
	
	// MARK: - Private Methods
	
	private func save() {
		do {
			try managedObjectContext.save()
		} catch {
			debugPrint(Const.ArticleManager.saveArticlesFailMessage)
		}
	}
}
