//
//  ArticleDetailsViewController.swift
//  Masiuk2021
//
//  Created by Anton M on 25.06.2021.
//

import UIKit
import Masiuk2021

// MARK: - ArticleDetails ViewController

class ArticleDetailsViewController: UIViewController {
		
	// MARK: - IBOutlets

	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var contentTextView: UITextView!
	@IBOutlet private var creationDateLabel: UILabel!
	@IBOutlet private var modificationDateLabel: UILabel!
	
	// MARK: - Internal Properties

	internal var articleModel: Article!

	// MARK: - ViewController Lifecycle Methods

	override func viewDidLoad() {
		super .viewDidLoad()
		
		setupViews()
	}
	
	// MARK: - Setup Methods

	private func setupViews() {
		titleLabel.text = articleModel.title ?? Const.ArticleDetailsViewController.noTitle
		contentTextView.text = articleModel.content
		creationDateLabel.text = articleModel.creationDate?.formattedString() ?? ""
		modificationDateLabel.text = articleModel.creationDate?.formattedString() ?? ""
	}
}
