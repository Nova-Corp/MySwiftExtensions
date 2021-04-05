//
//  String+Extension.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 11/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

extension String {
    var asURL: URL {
        return URL(string: self)!
    }

    var wordCount: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: utf16.count)) ?? 0
    }
}


extension String {
    func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
}

extension Date {
    func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
}
