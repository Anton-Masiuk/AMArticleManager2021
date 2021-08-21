//
//  ArticleManager.swift
//  AMArticleManager2021
//
//  Created by MSQUARDIAN on 8/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import CoreData
import UIKit

// MARK: - Article FetchKeys

enum ArticleFetchKeys: String {
	case title
	case content
	case language
}

// MARK: - Article Manager

public class ArticleManager {
	
	// MARK: - Public Properties
	
	public static let shared = ArticleManager()
	
	// MARK: - Private Properties
	
	private var managedObjectContext: NSManagedObjectContext
	let request: NSFetchRequest<Article> = Article.fetchRequest()
	
	// MARK: - Private Initializers
	
	private init() {
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
	
	public func newArticle(title: String, content: String, language: String, image: UIImage?) -> Article? {
		guard let article = NSEntityDescription.insertNewObject(forEntityName: Const.ArticleManager.articleModelName,
																														into: managedObjectContext) as? Article,
					getArticle(byTitle: title).isEmpty else { return nil }
		article.title = title
		article.content = content
		article.language = language
		article.creationDate = Date()
		article.modificationDate = nil
		if let imageData = image?.jpegData(compressionQuality: 0.8) {
			article.imageData = imageData
		}
		save()
		return article
	}
	
	
	public func getAllArticles() -> [Article] {
		
		return fetchRequest(key: nil, value: nil) ?? []
	}
	
	public func getArticles(byLanguage language: String) -> [Article] {
		return fetchRequest(key: .language, value: language) ?? []
	}
	
	public func getArticle(byTitle title: String) -> [Article] {
		return fetchRequest(key: .title, value: title) ?? []
	}
	
	public func getArticles(contains string: String) -> [Article] {
		return fetchRequest(key: .content, value: string) ?? []
	}
	
	public func remove(article: Article) {
		managedObjectContext.delete(article)
		save()
	}
	
	public func save() {
		if managedObjectContext.hasChanges {
			do {
				try managedObjectContext.save()
			} catch {
				debugPrint(error.localizedDescription)
			}
		}
	}
	
	// MARK: - Private Methods
	
	private func fetchRequest(key: ArticleFetchKeys?, value: String?) -> [Article]? {
		if let key = key, let value = value {
			request.predicate = NSPredicate(format: key.rawValue + Const.ArticleManager.predicateContainSuffix, value)
		} else {
			request.predicate = nil
		}
		guard let result = try? managedObjectContext.fetch(request) else {
			debugPrint(Const.ArticleManager.fetchRequestFailMessage)
			return nil
		}
		return result
	}
}
