//
//  LinkCardView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct LinkCardView: View {
    var body: some View {

            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: UIScreen.main.bounds.height * 0.125)
                    .foregroundColor(.white)
                HStack{
                    Image("amazon")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .padding(.horizontal, 25)
                    VStack{
                        HStack{
                        Text("Sample link name...")
                                .font(.FontRegular14)
                                .padding(.bottom,1)
                                .lineLimit(1)
                        Spacer()
                    }
                        HStack{
                            Text("22 Aug 2022")
                                .font(.FontRegular12)
                                .foregroundColor(.secondaryGray)
                            Spacer()
                        }
              
                    }
                  
                    HStack{
                        VStack{
                            HStack{
                                Text("2323")
                                    .font(.Font14)
                                    .padding(.bottom,1)
                                Spacer()
                            }
                            HStack{
                                Text("Clicks")
                                    .foregroundColor(.secondaryGray)
                                    .font(.FontRegular12)
                                Spacer()
                            }
                        }
                    }
                    .padding(.leading, 75)
                    
                 
                }
                .padding(.bottom, 30)
          
                ZStack{
                    Image("blueRect")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height * 0.04)
                        .foregroundColor(.lightBlue)
                    HStack{
                        Text("https://samplelink.oia.bio/ashd...")
                            .padding(.leading, 30)
                            .font(.FontRegular14)
                        Spacer()
                        Image("copy")
                            .resizable()
                            .frame(width: 15, height: 17)
                            .padding(.trailing, 30)
                    }
                    
                }
                .padding(.top, UIScreen.main.bounds.height * 0.101)
            
            
            
        }
       
    }
}

struct LinkCardView_Previews: PreviewProvider {
    static var previews: some View {
        LinkCardView()
    }
}
