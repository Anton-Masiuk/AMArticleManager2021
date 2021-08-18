//
//  Date+Extensions.swift
//  Masiuk2021
//
//  Created by Anton M on 06.07.2021.
//

import Foundation

extension Date {
	
	// MARK: - Internal Properties
	
	internal func formattedString() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = Const.Global.basicDateFormat
		return formatter.string(from: self)
	}
}
