//
//  DetailView.swift
//  CryptoApp
//
//  Created by Tamim Khan on 19/7/23.
//

import SwiftUI



struct DetailLodingView: View{
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack{
            if let coin = coin{
                Text(coin.name)
            }
        }
    }
}

struct DetailView: View {
    
   let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
    }
    
    var body: some View {
            Text(coin.name)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
