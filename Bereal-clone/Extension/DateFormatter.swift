//
//  DateFormatter.swift
//  Bereal-clone
//
//  Created by Semen Kolesnykov on 2/16/25.
//

import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
