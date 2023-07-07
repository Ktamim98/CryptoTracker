//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Tamim Khan on 3/7/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    
    @Published var statastic: [StatisticModel] = []
    
    private let coinDataService = CoinDataServices()
    private let marketDataService = MarketDataService()
    private var cancellabesls = Set<AnyCancellable>()
    
    init(){
        addSubscriber()
    }
    
    func addSubscriber(){
        
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filtercoins)
            .sink { [weak self] (returnedcoin) in
                self?.allCoins = returnedcoin
            }
            .store(in: &cancellabesls)
        
        
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (retundStats) in
                self?.statastic = retundStats
            }
            .store(in: &cancellabesls)
       
        
    }
    
    
    private func filtercoins(text: String, coins: [CoinModel]) -> [CoinModel]{
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel]{
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else{
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolioValue = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
        marketCap,
        volume,
        btcDominance,
        portfolioValue
        ])
        
        return stats
    }
    
    
}
