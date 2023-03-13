//
//  Optional.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import Foundation

extension Optional where Wrapped == String {
    var isNil: String {
        guard self != nil else {
            return "-"
        }
        
        return self!
    }
}
