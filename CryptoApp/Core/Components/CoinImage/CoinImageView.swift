//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Tamim Khan on 4/7/23.
//

import SwiftUI



struct CoinImageView: View {
    
    @StateObject var viewModel: CoinImageViewModel
    
    
    init(coin: CoinModel){
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let image = viewModel.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if viewModel.isLoading{
                ProgressView()
            }else{
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
