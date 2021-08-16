//
//  Const.swift
//  Exercise2
//
//  Created by user on 06.07.2021.
//

import Foundation

struct Const {
	
	// MARK: - Global

	struct Global {
		static let dateFormat = "dd-MMM-yyyy HH:mm"
	}
	
	// MARK: - View Controllers
	
	struct ArticleViewController {
		static let removeActionName = "Remove"
	}
	
	struct AddArticleViewController {
		static let noTitleMessage = "Please enter article's title"
		static let noContentMessage = "Please enter article's content"
		static let language = "en"
		static let alertActionTitle = "Ok"
		static let barButtontitle = "Done"
	}
	
	struct ArticleDetailsViewController {
		static let noTitleName = "No title"
	}
	
	// MARK: - TableView Cells

	struct ArticleTableViewCell {
		static let cellID = "ArticleCellReusableID"
		static let nibName = "ArticleTableViewCell"
	}
}
