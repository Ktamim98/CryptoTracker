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
    @State private var showLaunchView: Bool = true
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                NavigationView{
                    HomeView()
                        .navigationBarBackButtonHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(viewModel)
                
                ZStack{
                    if showLaunchView{
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
