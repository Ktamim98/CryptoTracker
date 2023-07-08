//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Tamim Khan on 8/7/23.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedCoin: CoinModel? = nil
    
    @State private var quantityText: String = ""
    
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(searchText: $viewModel.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil{
                        portfolioInputSection
                    }
                   
                }
            }
            .navigationTitle("Edit Portfoloi")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        XmarkButton()
                    }

                }
                ToolbarItem(placement: .navigationBarTrailing){
                    traillingNavBarButton
                }
                
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVm)
        
    }
}


extension PortfolioView{
    
   private var coinLogoList: some View{
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: 10){
                ForEach(viewModel.allCoins) { coin in
                   CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            selectedCoin = coin
                        }
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        })
    }
    
    private func getcurrentValue() -> Double{
        if let quentity = Double(quantityText){
            return quentity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View{
        VStack(spacing: 20){
            HStack{
                Text("Current Price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack{
                Text("Amount Holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack{
                Text("Current Value:")
                    Spacer()
                Text(getcurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none)
        .padding()
        .font(.headline)
    }
    
    private var traillingNavBarButton: some View{
            HStack(spacing: 10){
                Image(systemName: "checkmark")
                    .opacity(showCheckMark ? 1.0 : 0.0)
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("save".uppercased())
                })
                .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1.0 : 0.0)
            }

        
    }
    
    private func saveButtonPressed(){
        guard let coin = selectedCoin else {return}
        
        
        
        
        withAnimation(.easeIn){
            showCheckMark = true
            removeSelectedButton()
        }
        
        UIApplication.shared.endEditing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            withAnimation(.easeOut){
                showCheckMark = false
            }
        }
    }
    
    private func removeSelectedButton(){
        selectedCoin = nil
        viewModel.searchText = ""
    }
    
    
}
