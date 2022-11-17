//
//  Crypto.swift
//  myCrypto
//
//  Created by Yuriy on 16.11.2022.
//

struct Crypto: Decodable {
    //let status: CoinsStatus
    let data: [CoinsData]
}

//struct CoinsStatus: Decodable {
//    let timestamp: String
//}

struct CoinsData: Decodable {
    let name: String
    let symbol: String
    let slug: String
//    let max_supply: Int
//    let total_supply: Int
    let quote: Quote
    
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case symbol = "symbol"
//        case slug = "slug"
//        case maxSupply = "max_supply"
//        case totalSupply = "total_supply"
//        case quote = "quote"
//    }
}

struct Quote: Decodable {
    let USD: USD
}

struct USD: Decodable {
    let price: Double
    let volume_24h: Double
    let percent_change_1h: Double
    let percent_change_24h: Double
    let percent_change_7d: Double
    let percent_change_30d: Double
    let percent_change_60d: Double
    let percent_change_90d: Double

//    enum CodingKeys: String, CodingKey {
//        case price = "price"
//        case volumePerDay = "volume_24h"
//        case percentChangeOneHour = "percent_change_1h"
//        case percentChangePerDay = "percent_change_24h"
//        case percentChangeWeek = "percent_change_7d"
//        case percentChangeOneMonth = "percent_change_30d"
//        case percentChangeTwoMonths = "percent_change_60d"
//        case percentChangeThreeMonths = "percent_change_90d"
//    }
}
