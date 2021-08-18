//
//  Article.swift
//  Masiuk2021
//
//  Created by Anton M on 18.08.2021.
//

import Foundation

extension Article {

	// MARK: - Public Properties
	
	public var image: UIImage? {
		if let data = self.imageData {
			return UIImage(data: data)
		} else {
			return nil
		}
	}
}
