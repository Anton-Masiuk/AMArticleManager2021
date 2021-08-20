//
//  Article.swift
//  AMArticleManager2021
//
//  Created by Anton M on 18.08.2021.
//

import UIKit

// MARK: - Article Extension

extension Article {
	
	public var image: UIImage? {
		if let data = self.imageData {
			return UIImage(data: data)
		} else {
			return nil
		}
	}
}
