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
    
    func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
}

extension UIImage {
    // MARK:- Extension for converting Image into Base64 String
    
    func toBase64() -> String? {
        guard let imageData = self.lowestQualityJPEGNSData else { return nil }
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
}

extension Date {
    // MARK:- Extension for converting Date to String
    
    func toString(format: String, timeZone: TimeZone = .current) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        df.timeZone = timeZone
        return df.string(from: self)
    }
}
