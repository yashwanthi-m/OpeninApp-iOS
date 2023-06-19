//
//  ChartView.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    struct Item: Identifiable {
              var id = UUID()
              let type: String
              let value: Double
          }
    let items: [Item] = [
                  Item(type: "1", value: 100 ),
                  Item(type: "2", value: 80 ),
                  Item(type: "3", value: 120 ),
                  Item(type: "4", value: 20 ),
                  Item(type: "5", value: 55 ),
                  Item(type: "6", value: 170 ),
                  Item(type: "7", value: 20 ),
                  Item(type: "8", value: 10 ),
                  Item(type: "9", value: 5 ),
                  Item(type: "10", value: 1 ),
                  Item(type: "11", value: 500 ),
                  Item(type: "12", value: 700 )
              ]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(height: UIScreen.main.bounds.height * 0.28)
                .padding(.vertical, 20)
                .foregroundColor(.white)
                HStack{
                    Text("Overview")
                        .foregroundColor(.secondaryGray)
                        .font(.FontRegular14)
                        .padding(.leading, 30)
                        .padding(.bottom, 200)
                    Spacer()
                    RoundedRectangle(cornerRadius: 6)
                        .frame(width: 126, height: 25)
                        .foregroundColor(.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 0.5)
                                .padding(.horizontal, 0)
                                .overlay{
                                    HStack{
                                        Text("22 Aug - 23 Sept")
                                            .padding(.leading,5)
                                            .font(.FontRegular12)
                                        Image("clock")
                                            .padding(.trailing,5)
                                    }
                                }
                        )
                        .padding(.trailing, 10)
                        .padding(.bottom, 195)
                }

            Chart(items) { item in
                LineMark(
                    x: .value("Month", item.type),
                    y: .value("Revenue", item.value)
                )
                .foregroundStyle(Color.purple.gradient)
                
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .frame(height: UIScreen.main.bounds.height * 0.2, alignment: .bottom)
            .padding(.top, 20)
            .padding()
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
