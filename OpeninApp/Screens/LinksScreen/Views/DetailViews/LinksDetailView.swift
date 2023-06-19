//
//  LinksDetailView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct LinksDetailView: View {
    var body: some View {
        VStack{
        HStack{
            Button(action: {}, label: {
                Text("Top Links")
                    .font(.Font16)
                    .foregroundColor(.white)
                    .padding(.horizontal,20)
                    .padding(.vertical, 10)
                    .background{
                        Capsule()
                            .foregroundColor(.primaryBlue)
                    }
            })

            Button(action: {}, label: {
                Text("Recent Links")
                    .font(.Font16)
                    .foregroundColor(.white)
                    .padding(.horizontal,20)
                    .padding(.vertical, 10)
                    .background{
                        Capsule()
                            .foregroundColor(.primaryBlue)
                    }
            })
            Spacer()
            Button(action: {
                
            }, label: {
                Image("search")
                    .resizable()
                    .frame(width: 36, height: 36)
                    
            })
           
        }
        .padding(.vertical)
     
            ForEach(1..<5) { _ in
                LinkCardView()
                    .padding(.bottom, 20)
            }
        }
    }
}

struct LinksDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LinksDetailView()
    }
}
