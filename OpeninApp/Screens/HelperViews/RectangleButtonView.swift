//
//  RectangleButtonView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct RectangleButtonView: View {
    var buttonName: String
    var buttonColor: Color
    var accentColor: Color = .accentColor
    var textColor: Color
    var height: CGFloat
    var horizontalPadding: CGFloat = 0
    var imageName: String = ""
    var imgwidth: CGFloat = 25
    var imgheight: CGFloat = 25
    var isSystemName = false
    var isSpacer = false
    var borderColor: Color = .gray
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(buttonColor)
                .frame(height: height)
                .padding(.horizontal, horizontalPadding)
            HStack {
                if imageName != "" {
                    if isSystemName {
                        Image(systemName: imageName)
                            .resizable()
                            .frame(width: imgwidth, height: imgheight)
                            .accentColor(accentColor)
                            .padding(.leading, 10)
                    } else {
                        Image(imageName)
                            .resizable()
                            .frame(width: imgwidth, height: imgheight)
                            .padding(.leading, isSpacer ?  12.5 : 0)
                    }
                }
                Text(buttonName)
                    .font(.Font16)
                    .foregroundColor(textColor)
                if isSpacer {
                    Spacer()
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(borderColor, lineWidth: 0.5)
                .padding(.horizontal, horizontalPadding)
        )

    }
}

struct RectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButtonView(buttonName: "View Analytics", buttonColor: .clear, textColor: .primary, height: 52, horizontalPadding: 0, imageName: "price-boost", imgwidth: 20, imgheight: 18)
    }
}
