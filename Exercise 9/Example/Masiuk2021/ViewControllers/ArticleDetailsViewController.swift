//
//  DeathNoteDetailsViewController.swift
//  Exercise2
//
//  Created by user on 25.06.2021.
//

import UIKit
import Masiuk2021

class ArticleDetailsViewController: UIViewController {
		
	// MARK: - IBOutlets

	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var descriptionTextView: UITextView!
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
		titleLabel.text = "Title: \(articleeModel.title ?? "none")"
		descriptionTextView.text = articleeModel.content
		creationDateLabel.text = articleeModel.creationDate?.formattedString() ?? "none"
		modificationDateLabel.text = articleeModel.creationDate?.formattedString() ?? "none"
	}
}
