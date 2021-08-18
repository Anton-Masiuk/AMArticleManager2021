//
//  Const.swift
//  Masiuk2021
//
//  Created by Anton M on 17.08.2021.
//

import Foundation

internal struct Const {
	
	// MARK: - Managers
	
	internal struct ArticleManager {
		
		// MARK: - General
		
		static let articleModelName = "Article"
		static let momdExtension = "momd"
		
		// MARK: - Messages
		
		static let urlResourceFailMessage = "Failed to find article model resource"
		static let loadArticlesFailMessage = "Failed to load articles"
		static let saveArticlesFailMessage = "Failed to save changes in articles"
		static let fetchRequestFailMessage = "Fetch request failed"
	}
}
