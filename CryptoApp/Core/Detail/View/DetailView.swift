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
    
    @StateObject private var viewModel: DetailViewModel
    @State private var showFullDescription: Bool = false
    private let column: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    private let spacing: CGFloat = 30
   
    
    init(coin: CoinModel) {
       _viewModel = StateObject(wrappedValue: DetailViewModel(coin: coin))
        
      
    }
    
    var body: some View {
        ScrollView{
            VStack{
                
                ChartView(coin: viewModel.coin)
                    .padding(.vertical)
                
                VStack(spacing: 20){
                    overviewTitle
                    Divider()
                    descriptionSection
                    overViewGridItem
                    additionalTitle
                    Divider()
                    additionalGridItem
                    websiteSection
                }
                .padding()
            }
        }
        .background(
            Color.theme.background
                .ignoresSafeArea()
        )
        .navigationTitle(viewModel.coin.name)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                toolbarItem
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(coin: dev.coin)
        }
    }
}


extension DetailView{
    
    
    private var descriptionSection: some View{
        ZStack{
            if let coinDescription = viewModel.coinDescription, !coinDescription.isEmpty{
                
                VStack(alignment: .leading){
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    
                    Button {
                        
                            showFullDescription.toggle()
                        
                    } label: {
                        Text(showFullDescription ? "Less" : "See more..")
                            .animation(showFullDescription ? Animation.easeInOut : .none, value: showFullDescription)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    }
                    .tint(.blue)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    
    private var toolbarItem: some View{
        HStack {
            Text(viewModel.coin.symbol.uppercased())
                .font(.headline)
            .foregroundColor(Color.theme.secondaryText)
            
            CoinImageView(coin: viewModel.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View{
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    private var additionalTitle: some View{
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    private var overViewGridItem: some View{
        LazyVGrid(columns: column,
                  alignment: .leading,
                  spacing: spacing,
                  pinnedViews: [],
                  content: {
            ForEach(viewModel.overviewStatastics){ stat in
                StatasticView(stat: stat)
                
            }
        })
    }
    
    private var additionalGridItem: some View{
        LazyVGrid(columns: column,
                  alignment: .leading,
                  spacing: spacing,
                  pinnedViews: [],
                  content: {
            ForEach(viewModel.additionalStatastics){ stat in
                StatasticView(stat: stat)
                
            }
        })
    }
    
    private var websiteSection: some View{
        VStack(alignment: .leading, spacing: 20){
            if let websiteString = viewModel.websiteURL,
               let url = URL(string: websiteString){
                Link("Website", destination: url)
            }
            
            if let redditString = viewModel.redditURL,
               let url = URL(string: redditString){
                Link("Reddit", destination: url)
            }
        }
        .tint(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
    }
    
}
