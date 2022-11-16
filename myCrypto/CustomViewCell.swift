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
        priceLabel.text = String(format: "%.2f", coin.quote.usd.price)
        
        DispatchQueue.global().async {
            let stringUrl = "https://cryptocurrencyliveprices.com/api/\(coin.name.lowercased()).png"
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.coinLogoImage.image = UIImage(data: imageData)
            }
        }
    }

}
