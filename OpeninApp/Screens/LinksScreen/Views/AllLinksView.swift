//
//  AllLinksView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 20/06/2023.
//

import SwiftUI

struct AllLinksView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    @Binding var topLinks: Bool
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack {
                        StretchyRectangleView(cornerRadius: 0, heightpct: 0.08, rectColor: .primaryBlue)
                            .overlay {
                                HStack {
                                    Button(action: {
                                        dismiss()
                                    }, label: {
                                        BackButtonView(accentColor: .white, imgheight: 20, imgwidth: 10)
                                            .padding(.leading, 16)
                                            .padding(.top, 35)

                                    })
                                    Text("My Links (\(topLinks ? (viewModel.linkInfo.data?.topLinks.count ?? 0) : (viewModel.linkInfo.data?.recentLinks.count ?? 0)))")
                                        .foregroundColor(.white)
                                        .font(.Font24)
                                        .padding(.leading, 10)
                                        .padding(.top, 35)

                                    Spacer()
                                    Button(action: {

                                    }, label: {
                                        Image("NavButton")
                                            .padding(.trailing, 20)
                                            .padding(.top, 35)

                                    })
                                }

                            }
                        ZStack {
                            Rectangle()
                                .foregroundColor(.primaryGray)
                                .cornerRadius(20, corners: [.topLeft, .topRight])

                            ScrollView {
                                if topLinks {
                                    ForEach(0..<(viewModel.linkInfo.data?.topLinks.count ?? 0)) { i in
                                        LinkCardView(image: viewModel.linkInfo.data?.topLinks[i]?.originalImage ?? "", linkName: viewModel.linkInfo.data?.topLinks[i]?.title ?? "", date: String(viewModel.linkInfo.data?.topLinks[i]?.createdAt?.prefix(10) ?? ""), clicks: String(viewModel.linkInfo.data?.topLinks[i]?.totalClicks ?? 0), link: viewModel.linkInfo.data?.topLinks[i]?.smartLink ?? "")
                                            .padding(.bottom, 20)
                                    }
                                } else {
                                    ForEach(0..<(viewModel.linkInfo.data?.recentLinks.count ?? 0)) { i in
                                        LinkCardView(image: viewModel.linkInfo.data?.topLinks[i]?.originalImage ?? "", linkName: viewModel.linkInfo.data?.topLinks[i]?.title ?? "", date: String(viewModel.linkInfo.data?.topLinks[i]?.createdAt?.prefix(10) ?? ""), clicks: String(viewModel.linkInfo.data?.topLinks[i]?.totalClicks ?? 0), link: viewModel.linkInfo.data?.topLinks[i]?.smartLink ?? "")
                                            .padding(.bottom, 20)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 30)
                            .scrollIndicators(.hidden)

                        }
                        .offset(y: 45)

                    }
                }
            }

        }
        .navigationBarBackButtonHidden(true)
    }
}

// struct AllLinksView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllLinksView()
//    }
// }
