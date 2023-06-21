//
//  SquareInfoView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct SquareInfoView: View {
    var imageName : String
    var info : String
    var title : String
    var body: some View {
        Rectangle()        .frame(width: 120, height: 120)
            .cornerRadius(8, corners: [.allCorners])
            .foregroundColor(.white)
            .overlay{
                VStack{
                    HStack{
                        Image(imageName)
                            .padding(.bottom)
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Text(info)
                            .font(.Font16)
                        Spacer()
                    }
                    .padding(.vertical,1)
                    HStack{
                        Text(title)
                            .font(.FontRegular14)
                            .foregroundColor(.secondaryGray)
                        Spacer()
                    }
                }
                .padding(.leading)
                .padding(.vertical)
            
    }
    }
}

struct SquareInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SquareInfoView(imageName: "", info: "", title: "")
    }
}
