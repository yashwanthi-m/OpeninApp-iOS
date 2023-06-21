//
//  LinksDetailView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct LinksDetailView: View {
    @ObservedObject var viewModel : ViewModel
    @Binding var topLinksSelected : Bool
    @Binding var recentLinksSelected : Bool
    @Namespace private var animation
    var body: some View {
        VStack{
        HStack{
            Button(action: {
                withAnimation{
                    topLinksSelected = true
                    recentLinksSelected = false
                }
            }, label: {
                Text("Top Links")
                    .font(.Font16)
                    .foregroundColor(topLinksSelected ? .white : .secondaryGray)
                    .padding(.horizontal,20)
                    .padding(.vertical, 10)
                    .background{
                        topLinksSelected ?
                        Capsule()
                            .matchedGeometryEffect(id: "Shape", in: animation)
                            .foregroundColor(.primaryBlue) : nil
                    }
            })

            Button(action: {
                withAnimation{
                    topLinksSelected = false
                    recentLinksSelected = true
                }
            }, label: {
                Text("Recent Links")
                    .font(.Font16)
                    .foregroundColor(recentLinksSelected ? .white : .secondaryGray)
                    .padding(.horizontal,20)
                    .padding(.vertical, 10)
                    .background{
                        
                        recentLinksSelected ?
                        Capsule()
                            .matchedGeometryEffect(id: "Shape", in: animation)
                            .foregroundColor(.primaryBlue) : nil
                    }
            })
            Spacer()
            Button(action:{

            }, label: {
                Image("search")
                    .resizable()
                    .frame(width: 36, height: 36)
                    
            })
           
        }
        .padding(.vertical)
            if topLinksSelected == true {
                if let countTopLinks = viewModel.linkInfo.data?.topLinks.count {
                    let count = countTopLinks > 4 ? 4 : countTopLinks
                    ForEach(0..<count) { i in
                        LinkCardView(image: viewModel.linkInfo.data?.topLinks[i]?.originalImage ?? "", linkName: viewModel.linkInfo.data?.topLinks[i]?.title ?? "", date: String(viewModel.linkInfo.data?.topLinks[i]?.createdAt?.prefix(10) ?? ""), clicks: String(viewModel.linkInfo.data?.topLinks[i]?.totalClicks ?? 0), link: viewModel.linkInfo.data?.topLinks[i]?.smartLink ?? "")
                            .padding(.bottom, 20)


                    }
                }
            }
            else {
                if let countTopLinks = viewModel.linkInfo.data?.recentLinks.count {
                    let count = countTopLinks > 4 ? 4 : countTopLinks
                    ForEach(0..<count) { i in
                        LinkCardView(image: viewModel.linkInfo.data?.recentLinks[i]?.originalImage ?? "", linkName: viewModel.linkInfo.data?.recentLinks[i]?.title ?? "", date: String(viewModel.linkInfo.data?.recentLinks[i]?.createdAt?.prefix(10) ?? ""), clicks: String(viewModel.linkInfo.data?.recentLinks[i]?.totalClicks ?? 0) , link: viewModel.linkInfo.data?.recentLinks[i]?.smartLink ?? "")
                            .padding(.bottom, 20)
                    }
                }
            }
        }
    }
}

//struct LinksDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinksDetailView()
//    }
//}
