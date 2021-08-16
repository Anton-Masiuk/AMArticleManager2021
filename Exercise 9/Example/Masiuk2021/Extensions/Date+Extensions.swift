//
//  Date+Extensions.swift
//  Exercise2
//
//  Created by user on 06.07.2021.
//

import Foundation

extension Date {
	
	// MARK: - Internal Properties
	
	internal func formattedString() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = Const.Global.dateFormat
		return formatter.string(from: self)
	}
}
