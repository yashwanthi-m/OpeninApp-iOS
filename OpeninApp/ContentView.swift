//
//  ContentView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
           LinksView()
                .tabItem{
                   Label("Links", image: "links")
                        .foregroundColor(.primary)
                }
          CoursesView()
                .tabItem{
                   Label("Courses", image: "magazine")
                        .foregroundColor(.primary)
                }
          CampaignsView()
                .tabItem{
                   Label("Campaigns", image: "fast-forward")
                        .foregroundColor(.primary)
                }
          ProfileView()
                .tabItem{
                   Label("Profile", image: "user")
                }
            
        }
        .ignoresSafeArea()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
