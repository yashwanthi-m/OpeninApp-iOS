//
//  ScrollableInfoCardsView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct ScrollableInfoCardsView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                SquareInfoView(imageName: "Avatar", info: "123", title: "Today's Clicks")
                SquareInfoView(imageName: "Avatar-2", info: "Ahemdabad", title: "Top Location")
                SquareInfoView(imageName: "Avatar-3", info: "Instagram", title: "Top Source")
                SquareInfoView(imageName: "Avatar-4", info: "11.00 - 12.00", title: "Best Time")
            }
        }
    }
}

struct ScrollableInfoCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableInfoCardsView()
    }
}
