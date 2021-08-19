//
//  ArticlesViewController.swift
//  Masiuk2021
//
//  Created by Anton M on 08/12/2021.
//

import UIKit
import Masiuk2021

// MARK: - Articles ViewController

class ArticlesViewController: UIViewController {
	
	// MARK: - IBOutlets
	
	@IBOutlet var tableView: UITableView!
	
	// MARK: - Private Properties
	
	private let articleManager = ArticleManager.shared
	private var articles: [Article] = []
	
	// MARK: - Lifecycle Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupSettings()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		articles = articleManager.getAllArticles()
		runFetchTests()
		tableView.reloadData()
	}
	
	// MARK: - Setup Methods
	
	private func setupSettings() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: Const.ArticleTableViewCell.cellNibName, bundle: nil),
											 forCellReuseIdentifier: Const.ArticleTableViewCell.cellID)
		if navigationController != nil {
			let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
																						 target: self,
																						 action: #selector(pushAddArticleViewController))
			navigationItem.rightBarButtonItem = addBarButtonItem
		}
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
	
	private func remove(at index: IndexPath) {
		let article = articles.remove(at: index.row)
		articleManager.remove(article: article)
		tableView.reloadData()
	}
	
	private func runFetchTests() {
		configureTestArticles()
		testFetchByContent()
		testFetchByTitle()
		testFetchByLanguage()
	}
	
	private func configureTestArticles() {
		if articles == [] {
			for index in 0..<Const.podTests.title.count {
				let _ = articleManager.newArticle(title: Const.podTests.title[index],
																					content: Const.podTests.content[index],
																					language: Const.podTests.language[index],
																					image: nil)
			}
		}
		articles = articleManager.getAllArticles()
		tableView.reloadData()
	}
	
	private func testFetchByContent() {
		if let substring = articles.first?.content?.prefix(3) {
			let string = String(substring)
			print(Const.podTests.fetchMessagePrefix + string + Const.podTests.contentFetchMessageSuffix)
			print(articleManager.getArticles(contain: string))
		}
	}
	
	private func testFetchByTitle() {
		if let substring = articles.last?.title?.suffix(1) {
			let title = String(substring)
			print(Const.podTests.fetchMessagePrefix + title + Const.podTests.titleFetchMessageSuffix)
			print(articleManager.getArticle(byTitle: title))
		}
	}
	
	private func testFetchByLanguage() {
		if let language = Const.podTests.language.last {
			print(Const.podTests.fetchMessagePrefix + language + Const.podTests.contentFetchMessageSuffix)
			print(articleManager.getArticles(inLanguage: language))
		}
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


