//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Tamim Khan on 27/6/23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}
