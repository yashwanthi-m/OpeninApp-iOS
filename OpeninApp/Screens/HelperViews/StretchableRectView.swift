//
//  NonStrecthableRect.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct StretchyRectangleView: View {
    private let kHeaderHeight: CGFloat = 300
    var cornerRadius: CGFloat
    var heightpct: CGFloat
    var rectColor: Color
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            if geometry.frame(in: .global).minY <= 0 {
                Rectangle()
                    .foregroundColor(rectColor)
                    .cornerRadius(cornerRadius, corners: [.bottomRight, .bottomLeft]
                    )
                    .frame(width: geometry.size.width,
                           height: UIScreen.main.bounds.height * heightpct)
            } else {
                Rectangle()
                    .foregroundColor(rectColor)
                    .cornerRadius(cornerRadius, corners: [.bottomLeft, .bottomRight])
                    .offset(y: -geometry.frame(in: .global).minY)
                    .frame(width: geometry.size.width,
                           height: UIScreen.main.bounds.height * heightpct
                            + geometry.frame(in: .global).minY)
            }
        }.frame(maxHeight: 0)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
