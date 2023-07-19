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
               DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject var viewModel: DetailViewModel
    
   
    
    init(coin: CoinModel) {
       _viewModel = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("\(coin.name)")
      
    }
    
    var body: some View {
            Text("hello")
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
