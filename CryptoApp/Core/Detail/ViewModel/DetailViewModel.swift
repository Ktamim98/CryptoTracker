//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Tamim Khan on 20/7/23.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject{
    
    private let coinDataService: CoinDetailDataService
    private var cancelLables = Set<AnyCancellable>()
    
    init(coin: CoinModel){
        self.coinDataService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers(){
        coinDataService.$coinDetails
            .sink { (returnCoinDetails) in
                print(returnCoinDetails)
            }
            .store(in: &cancelLables)
    }
    
}
