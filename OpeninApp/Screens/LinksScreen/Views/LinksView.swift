//
//  LinksView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct LinksView: View {
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    StretchyRectangleView(cornerRadius: 0, heightpct: 0.08, rectColor: .primaryBlue)
                        .overlay{
                            HStack{
                                Text("Dashboard")
                                    .foregroundColor(.white)
                                    .font(.Font24)
                                    .padding(.leading, 25)
                                    .padding(.top, 28)
                                Spacer()
                                Button(action: {
                                    
                                }, label: {
                                    Image("NavButton")
                                        .padding(.trailing, 20)
                                        .padding(.top, 20)
                                })
                            }
                        }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.primaryGray)
                            .cornerRadius(20, corners: [.topLeft,.topRight])
                        
                        ScrollView{
                            HStack{
                                Text("Good morning")
                                    .foregroundColor(.secondaryGray)
                                Spacer()
                            }
                            .padding(.top, 32)
                            HStack{
                                Text("Ajay Manva")
                                    .font(.Font24)
                                Image("Hi")
                                    .frame(width: 28, height: 28)
                                Spacer()
                            }
                            .padding(.top, 2)
                            
                            ChartView()
                            
                            ScrollableInfoCardsView()
                            
                            Button(action: {
                                
                            }, label: {
                                RectangleButtonView(buttonName: "View Analytics", buttonColor: .clear, textColor: .primary, height: 52, horizontalPadding: 0, imageName: "price-boost", imgwidth: 20, imgheight: 18)
                                    .padding(.vertical, 20)
                            })
                            
                            LinksDetailView()
                            
                            Button(action: {
                                
                            }, label: {
                                RectangleButtonView(buttonName: "View All Links", buttonColor: .clear, textColor: .primary, height: 52, horizontalPadding: 0, imageName: "links", imgwidth: 20, imgheight: 18)
                                    .padding(.vertical, 20)
                            })
                            Spacer()
                            Button(action: {
                                openWhatsapp()
                            }, label: {
                                RectangleButtonView(buttonName: "Talk with us", buttonColor: .borderGreen.opacity(0.12), textColor: .primary, height: 70, horizontalPadding: 0, imageName: "whatsapp", imgwidth: 24, imgheight: 24, isSpacer : true, borderColor : .borderGreen.opacity(0.32))
                                    .padding(.top, 20)
                                
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                RectangleButtonView(buttonName: "Frequently Asked Questions", buttonColor: .lightBlue, textColor: .primary, height: 70, horizontalPadding: 0, imageName: "question-mark", imgwidth: 24, imgheight: 24, isSpacer : true, borderColor : .borderBlue.opacity(0.32))
                                    .padding(.vertical, 5)
                            })
                            .padding(.bottom, 60)
                        }
                        .scrollIndicators(.hidden)
                        .padding(.horizontal, 16)
                        
                    }
                    .offset(y: 35)
                }
            }
            
        }
        
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
    }
}
