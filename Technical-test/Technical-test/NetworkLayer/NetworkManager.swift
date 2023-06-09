//
//  DataManager.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import Foundation


class NetworkManager {
    
    private let path = "https://www.swissquote.ch/mobile/iphone/Quote.action?formattedList&formatNumbers=true&listType=SMI&addServices=true&updateCounter=true&&s=smi&s=$smi&lastTime=0&&api=2&framework=6.1.1&format=json&locale=en&mobile=iphone&language=en&version=80200.0&formatNumbers=true&mid=5862297638228606086&wl=sq"
    
    
    func fetchQuotes(completionHandler: @escaping(Result<[NetworkModel.Quote], Error>) -> (Void)) {
        guard let url = URL(string: path) else {
            completionHandler(.failure(NSError.error(msg: "Invalid URL")))
            return
        }
        
        let request = URLRequest(url: url)
        URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            guard error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            guard let responseData = data else {
                completionHandler(.failure(NSError.error(msg: "Data nil")))
                return
            }
            
            do {
                let data = try JSONDecoder().decode([NetworkModel.Quote].self, from: responseData)
                completionHandler(.success(data))
            } catch {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}
