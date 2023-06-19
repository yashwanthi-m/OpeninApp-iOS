//
//  Color+.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import SwiftUI

extension Color {
    static var primaryBlue: Color {

        return Color.from(hex: "#0E6FFF")

    }
    static var primaryGray: Color {

        return Color.from(hex: "#F5F5F5")

    }
    static var secondaryGray: Color {

        return Color.from(hex: "#999CA0")

    }
    static var lightBlue: Color {

        return Color.from(hex: "#E8F1FF")

    }
    static var borderBlue: Color {

        return Color.from(hex: "#0E6FFF")

    }
    static var borderGreen: Color {

        return Color.from(hex: "#4AD15F")

    }


    static func from(hex string: String) -> Color {
        var string = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        switch string.count {
        case 2:
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            return self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        case 4:
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            return self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        case 6:
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            return self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        case 8:
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            return self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        default:
            preconditionFailure("Does not support conversion.")
        }
    }
}

