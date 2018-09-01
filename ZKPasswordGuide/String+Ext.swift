//
//  String+Ext.swift
//  ZKPasswordGuide
//
//  Created by Zeeshan Khan on 8/31/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import Foundation

extension String {
    
    var isNumberIncluded: Bool {
        let numberRegEx = ".*[0-9]+.*"
        let numbertest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numbertest.evaluate(with: self)
    }
    
    var isUppercaseIncluded: Bool {
        let upperRegEx = ".*[A-Z]+.*"
        let uppertest = NSPredicate(format:"SELF MATCHES %@", upperRegEx)
        return uppertest.evaluate(with: self)
    }
    
    var isSpecialCharIncluded: Bool {
        let regex = try! NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
        let isSpecOk = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(), range:NSMakeRange(0, self.count)) != nil
        return isSpecOk
    }
}
