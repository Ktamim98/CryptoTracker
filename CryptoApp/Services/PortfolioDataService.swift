//
//  PortfolioDataService.swift
//  CryptoApp
//
//  Created by Tamim Khan on 9/7/23.
//

import Foundation
import CoreData

class PortfolioDataService{
    
    private let container: NSPersistentContainer
    private let containerNamne: String = "PortfolioContainer"
    private let entityNamne: String = "PortfolioEntity"
    @Published var savedEntities: [PortfolioEntity] = []
    
    init(){
        container = NSPersistentContainer(name: containerNamne)
        container.loadPersistentStores { _, error in
            if let error = error{
                print("error loading coredata \(error)")
            }
            self.getPortfolio()
        }
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double){
        if let entity = savedEntities.first(where: {$0.coinID == coin.id}){
            if amount > 0{
                update(entity: entity, amount: amount)
            }else{
                delete(entity: entity)
            }
        }else{
            add(coin: coin, amount: amount)
        }
    }
    
    
    private func getPortfolio(){
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityNamne)
        do {
          savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching portfolio entities \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double){
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double){
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntity){
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    
    private func save(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("unable to save coredata \(error)")
        }
    }
    
    private func applyChanges(){
        save()
        getPortfolio()
    }
    
}
