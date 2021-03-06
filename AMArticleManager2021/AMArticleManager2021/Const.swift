//
//  Const.swift
//  AMArticleManager2021
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
		
		// MARK: - Fetch Requst
		
		static let predicateContainSuffix =  " CONTAINS[c] %@"
		
		// MARK: - Messages
		
		static let urlResourceFailMessage = "Failed to find article model resource"
		static let loadArticlesFailMessage = "Failed to load articles"
		static let fetchRequestFailMessage = "Fetch request failed"
	}
}
