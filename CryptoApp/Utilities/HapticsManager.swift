//
//  HapticsManager.swift
//  CryptoApp
//
//  Created by Tamim Khan on 18/7/23.
//

import Foundation
import SwiftUI

class HapticsManager{
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}
