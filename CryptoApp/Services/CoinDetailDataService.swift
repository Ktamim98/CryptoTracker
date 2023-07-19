//
//  CoinDetailDataService.swift
//  CryptoApp
//
//  Created by Tamim Khan on 20/7/23.
//

import Foundation
import Combine


class CoinDetailDataService{
    @Published var coinDetails: CoinDetailModel? = nil
    var coinDetalSubscription: AnyCancellable?
    
    let coin: CoinModel
    
    init(coin: CoinModel){
        self.coin = coin
        getCoinDetail()
    }
    
    func getCoinDetail(){
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {return}
        
        coinDetalSubscription = NetworkManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnCoinDetails) in
                self?.coinDetails = returnCoinDetails
                self?.coinDetalSubscription?.cancel()
            })
    }
}

