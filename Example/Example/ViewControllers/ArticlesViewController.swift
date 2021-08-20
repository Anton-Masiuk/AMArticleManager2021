//
//  ArticlesViewController.swift
//  AMArticleManager2021
//
//  Created by Anton M on 08/12/2021.
//

import UIKit
import AMArticleManager2021

// MARK: - Articles ViewController

class ArticlesViewController: UIViewController {
	
	// MARK: - IBOutlets
	
	@IBOutlet var tableView: UITableView!
	
	// MARK: - Private Properties
	
	private let articleManager = ArticleManager.shared
	private var articles: [Article] = []
	private let articleSearchController = UISearchController()
	
	// MARK: - Lifecycle Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupSettings()
		loadAllArticles()
		addTestArticles()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		loadAllArticles()
	}
	
	// MARK: - Setup Methods
	
	private func setupSettings() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: Const.ArticleTableViewCell.cellNibName, bundle: nil),
											 forCellReuseIdentifier: Const.ArticleTableViewCell.cellID)
		articleSearchController.searchBar.delegate = self
		articleSearchController.delegate = self
		let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
																					 target: self,
																					 action: #selector(pushAddArticleViewController))
		navigationItem.rightBarButtonItem = addBarButtonItem
		navigationItem.searchController = articleSearchController
		navigationItem.hidesSearchBarWhenScrolling = false
	}
	
	// MARK: - Action Methods
	
	@objc private func pushAddArticleViewController() {
		guard let addArticleViewController = UIStoryboard.addArticleViewController() else { return }
		navigationController?.pushViewController(addArticleViewController, animated: true)
	}
	
	// MARK: - Private Methods
	
	private func pushArticleDetailsViewController(with articleModel: Article) {
		guard let articleDetailsViewController = UIStoryboard.articleDetailsViewController() else { return }
		
		articleDetailsViewController.articleModel = articleModel
		articleDetailsViewController.title = articleModel.title ?? Const.ArticleDetailsViewController.noTitle
		self.navigationController?.pushViewController(articleDetailsViewController, animated: true)
	}
	
	private func loadAllArticles() {
		articles = articleManager.getAllArticles()
		tableView.reloadData()
	}
	
	private func remove(at index: IndexPath) {
		let article = articles.remove(at: index.row)
		articleManager.remove(article: article)
		tableView.reloadData()
	}
	
	private func addTestArticles() {
		guard let article1 = articleManager.newArticle(title: "Test1",
																									 content: "And this is how it goes: <some story>",
																									 language: "en", image: nil),
					let article2 = articleManager.newArticle(title: "Test2",
																									 content: "London is a capital of Great Britain",
																									 language: "ru", image: nil),
					let article3 = articleManager.newArticle(title: "Article1",
																									 content: "pen and pencil",
																									 language: "en", image: nil) else { return }
		articles = [article1, article2, article3]
		tableView.reloadData()
	}
}

// MARK: - UITableViewDelegate Extension

extension ArticlesViewController: UITableViewDelegate {
	
	internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let articleModel = articles[indexPath.row]
		pushArticleDetailsViewController(with: articleModel)
	}
	
	internal func tableView(_ tableView: UITableView,
								 trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let removeAction = UIContextualAction(style: .normal,
																					title: Const.ArticleViewController.removeActionTitle) {
			[weak self] (action, view, completionHandler) in
			self?.remove(at: indexPath)
			completionHandler(true)
		}
		removeAction.backgroundColor = .systemRed
		return UISwipeActionsConfiguration(actions: [removeAction])
	}
}

// MARK: - UITableViewDataSource Extension

extension ArticlesViewController: UITableViewDataSource {
	
	internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.ArticleTableViewCell.cellID,
																									 for: indexPath) as? ArticleTableViewCell else {
			return UITableViewCell()
		}
		cell.update(withModel: articles[indexPath.row])
		return cell
	}
	
	internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articles.count
	}
	
	internal func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
}

// MARK: - UISearchControllerDelegate Extension


extension ArticlesViewController: UISearchControllerDelegate {
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		loadAllArticles()
	}
}

// MARK: - UISearchBarDelegate Extension

extension ArticlesViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let searchPhrase = searchBar.text else {
			loadAllArticles()
			return
		}
		articles = articleManager.getArticles(contains: searchPhrase)
		if articles.isEmpty {
			articles = articleManager.getArticle(byTitle: searchPhrase)
		}
		if articles.isEmpty {
			articles = articleManager.getArticles(byLanguage: searchPhrase)
		}
		tableView.reloadData()
	}
}
