//
//  NetworkManager.swift
//  myCrypto
//
//  Created by Yuriy on 16.11.2022.
//

import Foundation

enum Link: String {
    case cryptoUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=87093fe5-4312-4cc8-8bbe-9d25d0ba2af6"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCrypto(from url: String, completion: @escaping (Result<Crypto, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let crypto  = try JSONDecoder().decode(Crypto.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(crypto))
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchImage(from url: String?, comletion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            comletion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                comletion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                comletion(.success(imageData))
            }
        }
    }
}
