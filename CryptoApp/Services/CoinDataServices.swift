//
//  CoinDataServices.swift
//  CryptoApp
//
//  Created by Tamim Khan on 3/7/23.
//

import Foundation
import Combine


class CoinDataServices{
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init(){
        getCoin()
    }
    
    func getCoin(){
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else {return}
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            })
    }
}
