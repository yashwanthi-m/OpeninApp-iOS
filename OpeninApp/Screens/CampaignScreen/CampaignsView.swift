//
//  CampaignsView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct CampaignsView: View {
    var body: some View {
        ZStack {
            Color.primaryGray
            VStack {
                Image(systemName: "mic.fill")
                    .resizable()
                    .frame(width: 100, height: 150)
                    .foregroundColor(.red.opacity(0.4))
                    .padding()
                Text("Coming Soon!")
                    .font(.Font24)
            }
        }
        .ignoresSafeArea()
    }
}

struct CampaignsView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignsView()
    }
}
