//
//  ArticleTableViewCell.swift
//  Masiuk2021
//
//  Created by user on 22.06.2021.
//

import UIKit
import Masiuk2021

class ArticleTableViewCell: UITableViewCell {

	// MARK: - IBOutlets

	@IBOutlet weak private var titleLabel: UILabel!
	@IBOutlet weak private var creationDateLabel: UILabel!
	@IBOutlet weak private var contentLabel: UILabel!
	
	// MARK: - Internal Methods
	
	internal func update(withModel model: Article) {
		titleLabel.text = model.title
		creationDateLabel.text = model.creationDate?.formattedString()
		contentLabel.text = model.content
	}
}
