//
//  DateHelper.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 20/06/2023.
//

import Foundation
//String to Date Convert

func dateStringToMonthString(dateString : String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let s = dateFormatter.date(from: dateString) ?? Date()
    let dateFormatter2 = DateFormatter()
    dateFormatter2.dateFormat = "yyyy-MMM-dd"
    let date = dateFormatter2.string(from: s)
    let dateStr = date.suffix(2)
    let monthStr = String(date.suffix(from: date.index(date.startIndex, offsetBy: 5))).prefix(3)
    let dateStr2 = dateStr + "-" + monthStr
    return String(dateStr2)
}
func dateStringToYearString(dateString : String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let s = dateFormatter.date(from: dateString) ?? Date()
    let dateFormatter2 = DateFormatter()
    dateFormatter2.dateFormat = "yyyy-MMM-dd"
    let date = dateFormatter2.string(from: s)
    let dateStr = date.suffix(2)
    let monthStr = String(date.suffix(from: date.index(date.startIndex, offsetBy: 5))).prefix(3)
    let yearStr = String(date.suffix(from: date.index(date.startIndex, offsetBy: 0))).prefix(4)
    let dateStr2 = dateStr + " " + monthStr + " " + yearStr
    return String(dateStr2)

}







