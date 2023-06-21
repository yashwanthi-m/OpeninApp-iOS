//
//  WhatsappHelper.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//
import UIKit

func openWhatsapp(number : String) {
    let phoneNumber =  number // you need to change this number
    let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
    if UIApplication.shared.canOpenURL(appURL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        }
        else {
            UIApplication.shared.openURL(appURL)
        }
    }
}
