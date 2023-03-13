//
//  NetworkMoel.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import Foundation

enum NetworkModel {
    struct Quote: Codable {
        var news: String?
        var paidPrices: String?
        var orderbook: String?
        var analyseIt: String?
        var estimates: String?
        var description: String?
        var bid: String?
        var ask: String?
        var exchange: String?
        var close: String?
        var lastTime: String?
        var isin: String?
        var exchangeId: String?
        var high: String?
        var low: String?
        var volume: String?
        var typeId: String?
        var priceAlertable: String?
        var delayed: String?
        var lastChange: String?
        var lastChangePercent: String?
        var lastDate: String?
        var tradable: String?
        var askSize: String?
        var bidSize: String?
        var open: String?
        var high52: String?
        var low52: String?
        var industryName: String?
        var sectorName: String?
        var estimatedPrice: String?
        var stopTrading: String?
        var readableLastChangePercent: String?
        var readableLastTimeOrDate: String?
        var variationColor: String?
        var sharable: String?
        var newsAlertable: String?
        var last: String?
        var symbol: String?
        var currency: String?
        var name: String?
        var key: String?
    }
}



