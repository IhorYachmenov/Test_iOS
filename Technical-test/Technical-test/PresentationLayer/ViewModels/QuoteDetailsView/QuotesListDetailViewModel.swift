//
//  QuotesListDetailViewModel.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import Foundation

class QuotesListDetailViewModel: QuotesListDetailInterface {
    /// For the test task I created an array without any data layer implementation
    private var localStorage: LocalStorageInterface!
    
    init() {
        localStorage = LocalStorage()
    }
    
    func addToFavorite(data: PresentationModel.Quote) {
        
        localStorage.saveData(data: data.toDataEntities()) { error in
            if let error = error {
                print(error)
            } else {
                print("Data Saved")
            }
        }
    }
}
