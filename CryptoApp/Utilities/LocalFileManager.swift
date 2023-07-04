//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Tamim Khan on 4/7/23.
//

import Foundation
import SwiftUI


class LocalFileManager{
    
    static let instance = LocalFileManager()
    
    private init(){}
    
    func saveImage(image: UIImage, imageName: String, folderName: String){
        creatFolderIfNeeded(folderName: folderName)
        
        guard let data = image.pngData(),
              let url = getUrlForImage(imageName: imageName, folderName: folderName)
        else { return }
        
        do{
            try data.write(to: url)
        }catch let error{
            print("failed to save image. \(error)")
        }
        
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage?{
        guard let url = getUrlForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {return nil}
        return UIImage(contentsOfFile: url.path)
    }
    
    private func creatFolderIfNeeded(folderName: String){
        guard let url = getUrlForFolder(folderName: folderName) else {return}
        
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("error creating directory \(folderName). \(error)")
            }
        }
    }
    
    
    private func getUrlForFolder(folderName: String) -> URL?{
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlForImage(imageName: String, folderName: String) -> URL?{
        guard let folderUrl = getUrlForFolder(folderName: folderName) else {return nil}
        
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
   
}
