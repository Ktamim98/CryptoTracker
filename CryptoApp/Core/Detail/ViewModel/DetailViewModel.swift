//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Tamim Khan on 20/7/23.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject{
    
    @Published var overviewStatastics: [StatisticModel] = []
    @Published var additionalStatastics: [StatisticModel] = []
    
    @Published var coinDescription: String? = nil
    @Published var websiteURL: String? = nil
    @Published var redditURL: String? = nil
    
    
    @Published var coin: CoinModel
    
    private let coinDataService: CoinDetailDataService
    private var cancelLables = Set<AnyCancellable>()
    
    init(coin: CoinModel){
        self.coin = coin
        self.coinDataService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers(){
        coinDataService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] (returnedArray) in
                self?.overviewStatastics = returnedArray.overview
                self?.additionalStatastics = returnedArray.additional
            }
            .store(in: &cancelLables)
        
        
        coinDataService.$coinDetails
            .sink { [weak self] (returnedCoinDescription) in
                self?.coinDescription = returnedCoinDescription?.readableDescription
                self?.websiteURL = returnedCoinDescription?.links?.homepage?.first
                self?.redditURL = returnedCoinDescription?.links?.subredditURL
                
            }
            .store(in: &cancelLables)
    }
    
    
    
    private func mapDataToStatistics(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StatisticModel], additional: [StatisticModel]){
        let overviewArray = creatOverViewArray(coinModel: coinModel)
        let additionalArray = creatAdditionalArray(coinDetailModel: coinDetailModel, coinModel: coinModel)
        return (overviewArray, additionalArray)
    }
    
    
  private func creatOverViewArray(coinModel: CoinModel) -> [StatisticModel]{
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = StatisticModel(title: "Rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(title: "Volume", value: volume)
        
        
        let overviewArray: [StatisticModel] = [
        priceStat, marketCapStat, rankStat, volumeStat
        ]
        
        
        return overviewArray
    }
    
   private func creatAdditionalArray(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> [StatisticModel]{
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highstat = StatisticModel(title: " 24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
        
        
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24h Mrket Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
        
        let blocktime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blocktime == 0 ? "n/a" : "\(blocktime)"
        let blocktimeStat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hasingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        
        let additionalArray: [StatisticModel] = [
        highstat, lowStat, priceChangeStat, marketCapChangeStat, blocktimeStat, hasingStat
        ]
        
        return additionalArray
    }
   
    
}
