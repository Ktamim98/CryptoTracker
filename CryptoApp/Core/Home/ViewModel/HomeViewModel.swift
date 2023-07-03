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
    
    private let dataService = CoinDataServices()
    private var cancellabesls = Set<AnyCancellable>()
    
    init(){
        addSubscriber()
    }
    
    func addSubscriber(){
        dataService.$allCoins
            .sink { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
            }
            .store(in: &cancellabesls)
    }
    
    
}
