//
//  ChartView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI
import Charts

struct ChartView: View {

    @ObservedObject var viewModel: ViewModel
    @State var scrollSpot = ""
    struct Item: Identifiable {
        var id = UUID()
        let type: String
        let value: Int
    }

    let curGradient = LinearGradient(
        gradient: Gradient(
            colors: [
                Color.primaryBlue.opacity(0.4),
                Color.primaryBlue.opacity(0.0)
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )

    var items: [Item] = []
    let itemWidth: CGFloat = 50
    init(viewModel: ViewModel) {
        self.viewModel = viewModel

        for (key, value) in viewModel.linkInfo.data?.overallChartData ?? [:] {

            items.append(Item(type: key, value:
                                value))
            items = items.sorted {
                $0.type < $1.type
            }

        }

    }
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: UIScreen.main.bounds.height * 0.29)
                    .padding(.vertical, 20)
                    .foregroundColor(.white)
                HStack {
                    Text("Overview")
                        .foregroundColor(.secondaryGray)
                        .font(.FontRegular14)
                        .padding(.leading, 30)
                        .padding(.bottom, 200)
                    Spacer()
                    RoundedRectangle(cornerRadius: 6)
                        .frame(width: 126, height: 27)
                        .foregroundColor(.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 0.5)
                                .padding(.horizontal, 0)
                                .overlay {
                                    HStack {
                                        Text("21 May - 21 June")
                                            .padding(.leading, 5)
                                            .font(.FontRegular12)
                                        Image("clock")
                                            .padding(.trailing, 5)
                                    }
                                }
                        )
                        .padding(.trailing, 10)
                        .padding(.bottom, 200)
                }
                ScrollViewReader { scrollPosition in
                    ScrollView(.horizontal) {
                        // Create a ZStack with an HStack overlaying the chart.
                        // The HStack consists of invisible items that conform to the
                        // identifible protocol to provide positions for programmatic
                        // scrolling to the named location.
                        ZStack {
                            // Create an invisible rectangle for each x axis data point
                            // in the chart.
                            HStack(spacing: 0) {
                                ForEach(items.reversed()) { item in
                                    Rectangle()
                                        .fill(.clear)

                                        // Setting maxWidth to .infinity here, combined
                                        // with spacing:0 above, makes the rectangles
                                        // expand to fill the frame specified for the
                                        // chart below.
                                        .frame(maxWidth: .infinity, maxHeight: 0)

                                        // Here, set the rectangle's id to match the
                                        // charted data.
                                        .id(item.type)
                                }
                            }

                            Chart(items.reversed()) { item in
                                AreaMark(
                                    x: .value("Date", dateStringToMonthString(dateString: String(item.type))),
                                    y: .value("Points", item.value)
                                )
                                //                                                 .interpolationMethod(.catmullRom)
                                .foregroundStyle(curGradient)
                                LineMark(
                                    x: .value("Date", dateStringToMonthString(dateString: String(item.type))),
                                    y: .value("Points", item.value)
                                )
                                .foregroundStyle(Color.primaryBlue)

                                //                                .interpolationMethod(.catmullRom)
                            }
                            .chartYAxis {
                                AxisMarks(position: .leading)
                            }
                            .frame(width: CGFloat(items.count) * itemWidth)
                            .frame(height: UIScreen.main.bounds.height * 0.2, alignment: .bottom)
                            .padding(.top, 22.5)
                            .padding()
                        }
                    }
                    .padding()
                    .onChange(of: scrollSpot, perform: { y in
                        if y != "" {
                            scrollPosition.scrollTo(y)
                            scrollSpot = ""
                        }
                    })
                }
                .onAppear {
                    if let x = items.first?.type {
                        scrollSpot = x
                    }
                }
            }
        }
    }
}

// struct ChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartView(viewModel: <#ViewModel#>)
//    }
// }
