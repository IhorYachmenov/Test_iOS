//
//  QuotesListInterface.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import Foundation

enum PresentationModel {
    struct Quote {
        let name: String
        let last: String
        let currency: String
        let percent: String
        let symbol: String
        var variationColor: String
        let isFavorite: Bool
    }
}

protocol QuotesListInterface: AnyObject {
    var observeData: ((Result<[PresentationModel.Quote], Error>) -> ())? { get set }
    func fetchQuotes()
}
