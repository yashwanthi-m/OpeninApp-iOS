//
//  LinkCardView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

struct LinkCardView: View {
    var image: String
    var linkName: String
    var date: String
    var clicks: String
    var link: String

    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(height: UIScreen.main.bounds.height * 0.14)
                .foregroundColor(.white)
            HStack {
                if let imagehdURL = URL(string: image) {
                    Color.clear.overlay(
                        CacheAsyncImage(url: imagehdURL) { phase in
                            switch phase {
                            case.success(let image):
                                image.resizable()
                                    .padding(.horizontal, 12)
                                    .scaledToFit()
                            @unknown default:
                                Image("nopic")
                                    .resizable()
                                    .frame(width: 50, height: 48)
                                    .opacity(0.45)
                            }
                        }

                    )
                    .frame(width: 80, height: 48)
                }

                VStack {
                    HStack {
                        Text(linkName)
                            .font(.FontRegular14)
                            .padding(.bottom, 1)
                            .lineLimit(1)
                        Spacer()
                    }
                    HStack {
                        Text(dateStringToYearString(dateString: date))
                            .font(.FontRegular12)
                            .foregroundColor(.secondaryGray)
                        Spacer()
                    }

                }

                HStack {
                    VStack {
                        Text(clicks)
                            .font(.Font14)
                            .padding(.bottom, 1)

                        Text("Clicks")
                            .foregroundColor(.secondaryGray)
                            .font(.FontRegular12)

                    }
                }
                .padding(.leading, 50)
                .padding(.trailing, 10)

            }
            .padding(.bottom, 30)

            Button(action: {
                guard let url = URL(string: "https://" + link) else {
                    return
                }
                UIApplication.shared.open(url, completionHandler: { success in
                    if success {
                        print("opened")
                    } else {
                        print("failed")
                        // showInvalidUrlAlert()
                    }
                })

            }, label: {
                ZStack {
                    Image("blueRect")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height * 0.05)
                        .foregroundColor(.lightBlue)
                    HStack {
                        Text(link)
                            .padding(.leading, 12)
                            .font(.FontRegular14)
                            .foregroundColor(.primaryBlue)
                        Spacer()
                        Button(action: {
                            UIPasteboard.general.string = link
                        }, label: {
                            Image("copy")
                                .resizable()
                                .frame(width: 15, height: 17)
                                .padding(.trailing, 12)
                        })

                    }

                }
            })

            .padding(.top, UIScreen.main.bounds.height * 0.101)

        }

    }
}

// struct LinkCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinkCardView()
//    }
// }
