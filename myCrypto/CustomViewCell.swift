//
//  CustomViewCell.swift
//  myCrypto
//
//  Created by Yuriy on 16.11.2022.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    @IBOutlet var coinLogoImage: UIImageView!
    
    @IBOutlet var coinNameLabel: UILabel!
    @IBOutlet var coinSymbolLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!

    func configure(with coin: CoinsData) {
        coinNameLabel.text = coin.name
        coinSymbolLabel.text = coin.symbol
        priceLabel.text = String(format: "%.2f", coin.quote.USD.price)
        
        DispatchQueue.global().async {
            let stringUrl = "https://cryptoicons.org/api/icon/\(coin.symbol.lowercased())/50"
            guard let imageUrl = URL(string: stringUrl) else {
                print("Error url data")
                return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.coinLogoImage.image = UIImage(data: imageData)
            }
        }
        coinLogoImage.clipsToBounds = true
        coinLogoImage.frame.size = CGSize(width: 50, height: 50)
        
    }

}
