//
//  QuotesListDetailInterfaces.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import Foundation

extension PresentationModel.Quote {
    func toDataEntities() -> DataModel.Quote{
        return DataModel.Quote(
            name: self.name,
            last: self.last,
            currency: self.currency,
            percent: self.percent,
            symbol: self.symbol,
            variationColor: self.variationColor,
            isFavorite: self.isFavorite)
    }
}

protocol QuotesListDetailInterface: AnyObject {
    func addToFavorite(data: PresentationModel.Quote)
}
