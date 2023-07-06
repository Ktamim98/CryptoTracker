//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Tamim Khan on 6/7/23.
//

import Foundation
import SwiftUI


// dissmiss keyboard
extension UIApplication{
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
