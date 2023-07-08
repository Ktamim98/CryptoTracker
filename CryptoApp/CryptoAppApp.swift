//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Tamim Khan on 27/6/23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    @StateObject private var viewModel = HomeViewModel()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarBackButtonHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
