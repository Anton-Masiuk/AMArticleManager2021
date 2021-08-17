//
//  ArticleDetailsViewController.swift
//  Exercise2
//
//  Created by user on 25.06.2021.
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

	internal var articleeModel: Article!

	// MARK: - ViewController Lifecycle Methods

	override func viewDidLoad() {
		super .viewDidLoad()
		
		setupViews()
	}
	
	// MARK: - Setup Methods

	private func setupViews() {
		titleLabel.text = articleeModel.title ?? Const.ArticleDetailsViewController.noTitleName
		contentTextView.text = articleeModel.content
		creationDateLabel.text = articleeModel.creationDate?.formattedString() ?? ""
		modificationDateLabel.text = articleeModel.creationDate?.formattedString() ?? ""
	}
}
