//
//  ContentView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var linkViewModel = ViewModel()
    @State private var tbHeight = CGFloat.zero
    init() {
        UITabBar.appearance().backgroundColor =  UIColor.white
        UITabBar.appearance().barTintColor =  UIColor.white
}
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView{
                TabContent(height: $tbHeight, content: {
                    LinksView(viewModel: linkViewModel)
                        
                  
                })
                .tabItem{
                    Label("Links", image: "links")
                        
                }
                TabContent(height: $tbHeight, content: {
             
                    CoursesView()
                        
                
                })
                .tabItem{
                    Label("Courses", image: "magazine")
             
                }
                Spacer()
                TabContent(height: $tbHeight, content: {
              
                    CampaignsView()
                       
                   
                })
                .tabItem{
                    Label("Campaigns", image: "fast-forward")
                    
                }
                TabContent(height: $tbHeight, content: {
               
                    ProfileView()
                       
                })
                .tabItem{
                    Label("Profile", image: "user")
                }
            }
            TabSelection(height: tbHeight)
        }
    }
    
    struct TabSelection: View {
        let height: CGFloat
        
        var body: some View {
            VStack {
                Spacer()
                Curve()
                    .frame(maxWidth: .infinity, maxHeight: height)
                    .foregroundColor(.white)
            }
            .ignoresSafeArea()
            .overlay(
                Button(action: {
                    
                }, label: {
                    Circle().foregroundColor(.primaryBlue)
                        .frame(height: 65).aspectRatio(contentMode: .fit)
                        .shadow(color: .primaryBlue.opacity(0.6) , radius: 5, y: 3)
                        .overlay(Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white))
              
                })
                .offset(y: -7.5)
                
                , alignment: .bottom)
              
        }
    }
    
    struct TabContent<V: View>: View {
        @Binding var height: CGFloat
        @ViewBuilder var content: () -> V
        var body: some View {
            GeometryReader { gp in
                content()
                    .onAppear {
                        height = gp.safeAreaInsets.bottom
                    }
                    .onChange(of: gp.size) { _ in
                        height = gp.safeAreaInsets.bottom
                    }
            }
        }
    }
    
    struct Curve: Shape {
        func path(in rect: CGRect) -> Path {
            let h = -rect.maxY * 0.35
            return Path {
                $0.move(to: .zero)
                $0.addLine(to: CGPoint(x: rect.midX / 2.0, y: rect.minY))
                $0.addCurve(to: CGPoint(x: rect.midX, y: h), control1: CGPoint(x: rect.midX * 0.85, y: rect.minY), control2: CGPoint(x: rect.midX * 0.85, y: h))
                $0.addCurve(to: CGPoint(x: rect.midX * 3.0 / 2.0, y: rect.minY), control1: CGPoint(x: rect.midX * 1.15, y: h), control2: CGPoint(x: rect.midX * 1.15, y: rect.minY))
                $0.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
