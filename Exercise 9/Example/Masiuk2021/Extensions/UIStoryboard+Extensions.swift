//
//  UIStoryboard+Extensions.swift
//  Masiuk2021
//
//  Created by Anton M on 06.07.2021.
//

import UIKit

// MARK: - Storyboard Enum

enum Storyboard: String {
  case main = "Main"
  case articles = "Articles"
	case addArticle = "AddArticle"
	case articleDetails = "ArticleDetails"
}

// MARK: - UIStoryboard Controller Extensions

extension UIStoryboard {

  // MARK: - Internal Methods

	internal static func articlesViewController() -> ArticlesViewController? {
		let controller = UIStoryboard.viewController(ArticlesViewController.self, from: .articles)
		guard let viewController = controller as? ArticlesViewController? else { return nil }
		return viewController
	}
	
	internal static func addArticleViewController() -> AddArticleViewController? {
		let controller = UIStoryboard.viewController(AddArticleViewController.self, from: .addArticle)
		guard let viewController = controller as? AddArticleViewController else { return nil }
		return viewController
	}
	
	internal static func articleDetailsViewController() -> ArticleDetailsViewController? {
		let controller = UIStoryboard.viewController(ArticleDetailsViewController.self, from: .articleDetails)
		guard let viewController = controller as? ArticleDetailsViewController else { return nil }
		return viewController
	}
}

extension UIStoryboard {

  // MARK: - Private Methods

  private static func viewController(_ vcClass: AnyClass, from name: Storyboard = .main) -> UIViewController {
    let className = String(describing: vcClass)
    let storyboard = UIStoryboard(name: name.rawValue, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: className)
  }
}
