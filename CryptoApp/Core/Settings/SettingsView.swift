//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Tamim Khan on 24/7/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/Ktamim98")!
    let youtubeURL = URL(string: "https://youtube.com/c/swiftfulthinking")!
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.theme.background
                    .ignoresSafeArea()
                
                List{
                    CourseSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    CoingeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    DeveloperSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        XmarkButton()
                    }

                }
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


extension SettingsView{
    
    
    private var CourseSection: some View{
        Section(header: Text("Crypto App")){
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following youtube course, @SwiftfulThinking.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on youtube", destination: youtubeURL)
        }
    }
    
    
    private var CoingeckoSection: some View{
        Section(header: Text("CoinGecko")){
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The crypto API comes from coingecko's free API.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("CoinGecko website", destination: coingeckoURL)
        }
    }
    
    
    private var DeveloperSection: some View{
        Section(header: Text("Developer Info.")){
            VStack(alignment: .leading) {
                Image("developer")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("My self Tamim Khan.I'm a iOS developer.This is my portfolio app.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Github Link", destination: personalURL)
        }
    }
    
    private var applicationSection: some View{
        Section(header: Text("Application Info.")){
            Link("Terms of Services", destination: defaultURL)
            Link("Priacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }
    
}
