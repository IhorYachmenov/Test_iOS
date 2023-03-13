//
//  LocalStorageInterface.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import Foundation

enum DataModel {
    struct Quote: Encodable, Decodable {
        let name: String
        let last: String
        let currency: String
        let percent: String
        let symbol: String
        var variationColor: String
        let isFavorite: Bool
    }
}

protocol LocalStorageInterface: AnyObject {
    func saveData(data: DataModel.Quote, completion: @escaping(Error?) -> ())
}
