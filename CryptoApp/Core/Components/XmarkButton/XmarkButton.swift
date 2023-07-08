//
//  XmarkButton.swift
//  CryptoApp
//
//  Created by Tamim Khan on 8/7/23.
//

import SwiftUI

struct XmarkButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .foregroundColor(Color.theme.accent)
            .font(.headline)
    }
}

struct XmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XmarkButton()
    }
}
