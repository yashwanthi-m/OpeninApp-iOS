//
//  CoursesView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        ZStack{
            Color.primaryGray
            VStack {
                Image(systemName: "aqi.medium")
                    .resizable()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
                    .padding()
                Text("Coming Soon!")
                    .font(.Font24)
            }
        }
        .ignoresSafeArea()
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
