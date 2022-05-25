//
//  CGColor+hex.swift
//  
//
//  Created by Karolina Samorek on 10/05/2022.
//

import Foundation
import CoreGraphics

extension CGColor {
    /// Creates CGColor from hex.
    /// - Parameter hex: The hex value of a color. Supported formats: ``#xxxxxxxx`` and ``#xxxxxx``.
    /// - Returns: CGColor instance.
    public static func `from`(hex: String) -> Self? {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    return Self(red: r, green: g, blue: b, alpha: a)
                }
            } else if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x000000ff) / 255

                    return Self(red: r, green: g, blue: b, alpha: 1)
                }
            }
        }

        return nil
    }
}
