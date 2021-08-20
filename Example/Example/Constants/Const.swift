//
//  Const.swift
//  AMArticleManager2021
//
//  Created by Anton M on 06.07.2021.
//

import Foundation

struct Const {
	
	// MARK: - Global

	struct Global {
		static let basicDateFormat = "dd-MMM-yyyy HH:mm"
		static let defaultLanguage = "en"
	}
	
	// MARK: - ViewControllers
	
	struct ArticleViewController {
		static let removeActionTitle = "Remove"
	}
	
	struct AddArticleViewController {
		static let noTitleMessage = "Please enter article's title"
		static let noContentMessage = "Please enter article's content"
		static let nonUniqueTitleMessage = "Can't areate article. Title already exists"
		static let alertActionTitle = "Ok"
		static let barButtontitle = "Done"
	}
	
	struct ArticleDetailsViewController {
		static let noTitle = "No title"
	}
	
	// MARK: - TableView Cells

	struct ArticleTableViewCell {
		static let cellID = "ArticleCellReusableID"
		static let cellNibName = "ArticleTableViewCell"
	}
}
