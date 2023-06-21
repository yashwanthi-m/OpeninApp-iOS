//
//  BackButton.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 20/06/2023.
//

import SwiftUI

import SwiftUI

struct BackButtonView: View {
    var accentColor: Color = .white
    var imgheight: CGFloat = 12
    var imgwidth: CGFloat = 6
    var foregroundColor: Color = .white
    var imgName: String = "lessthan"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(foregroundColor)
                .frame(width: 40, height: 38)
                .opacity(0.2)

            Image(systemName: imgName)
                .resizable()
                .accentColor(accentColor)
                .frame(width: imgwidth, height: imgheight)

        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.secondaryGray, lineWidth: 0.5)               )
    }
}
