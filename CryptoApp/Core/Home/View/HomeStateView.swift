//
//  HomeStateView.swift
//  CryptoApp
//
//  Created by Tamim Khan on 6/7/23.
//

import SwiftUI

struct HomeStateView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack{
            ForEach(viewModel.statastic) { stat in
                StatasticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStateView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStateView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVm)
    }
}
