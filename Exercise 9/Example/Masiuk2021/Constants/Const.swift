//
//  Const.swift
//  Masiuk2021
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
	
	// MARK: - Masiuk2021 Pod Tests
	
	struct podTests {
		static let title = ["Test1", "Test2", "Article1"]
		static let content = [ "And this is how it goes: <some story>",
													 "London is a capital of Great Britain",
													 "pen and pencil"]
		static let language = ["en", "en", "ru"]
		static let fetchMessagePrefix = "\nFetch by '"
		static let contentFetchMessageSuffix = "' in content:"
		static let titleFetchMessageSuffix = "' in title:"
		static let languageFetchMessageSuffix = "' language:"
	}
}
