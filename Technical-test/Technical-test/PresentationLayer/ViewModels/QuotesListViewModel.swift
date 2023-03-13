//
//  QuotesListViewModel.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import Foundation

class QuotesListViewModel: QuotesListInterface {
    private let dataManager:NetworkManager = NetworkManager()
    
    var observeData: ((Result<[PresentationModel.Quote], Error>) -> ())?
    
    init() {}
    
    func fetchQuotes() {
        dataManager.fetchQuotes { [weak self] result in
            switch result {
            case .success(let success):
                let data = success.map({
                    PresentationModel.Quote(
                        name: $0.name.isNil,
                        last: $0.last.isNil,
                        currency: $0.currency.isNil,
                        percent: $0.readableLastChangePercent.isNil,
                        symbol: $0.symbol.isNil,
                        variationColor: $0.variationColor.isNil,
                        isFavorite: Bool.random())
                    
                })
                
                self?.observeData?(.success(data))
            case .failure(let failure):
                self?.observeData?(.failure(failure))
            }
        }
    }
}
