//
//  LocalStorage.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import Foundation

class LocalStorage: LocalStorageInterface {
    init() {
        
    }
  
    func saveData(data: DataModel.Quote, completion: @escaping (Error?) -> ()) {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(data)
            UserDefaults.standard.set(encodedData, forKey: data.name)
            readData(key: data.name)
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
    /// For Testing
    private func readData(key: String) {
        if let data = UserDefaults.standard.data(forKey: key) {
            
            do {
                let decoder = JSONDecoder()
                let quote = try decoder.decode(DataModel.Quote.self, from: data)
                print(quote)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    
}
