//
//  ScrollableInfoCardsView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct ScrollableInfoCardsView: View {
    var clicks : String
    var topLocation: String
    var topSource : String
    var time : String
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                SquareInfoView(imageName: "Avatar", info: clicks.isEmpty ? "--" : clicks, title: "Today's Clicks")
                SquareInfoView(imageName: "Avatar-2", info: topLocation.isEmpty ? "--" : topLocation , title: "Top Location")
                SquareInfoView(imageName: "Avatar-3", info: topSource.isEmpty ? "--" : topSource, title: "Top Source")
                SquareInfoView(imageName: "Avatar-4", info: time.isEmpty ? "--" : time, title: "Best Time")
            }
        }
    }
}

//struct ScrollableInfoCardsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollableInfoCardsView()
//    }
//}
