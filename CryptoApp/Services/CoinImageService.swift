//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Tamim Khan on 4/7/23.
//

import Foundation
import SwiftUI
import Combine


class CoinImageService{
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    
    private let coin: CoinModel
    
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_image"
    private let imageName: String
    
    init(coin: CoinModel){
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage(){
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName){
            image = savedImage
           
        }else{
            downloadCoinImage()
           
        }
    }
    
    
    private func downloadCoinImage(){
        
        guard let url = URL(string: coin.image) else {return}
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnImage) in
                guard let self = self, let downloadImage = returnImage else {return}
                self.image = downloadImage
                self.imageSubscription?.cancel()
                        self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            })
        
        
    }
}
