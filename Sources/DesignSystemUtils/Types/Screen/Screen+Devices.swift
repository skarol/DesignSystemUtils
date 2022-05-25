//
//  Screen+Devices.swift
//  
//
//  Created by Karolina Samorek on 20/04/2022.
//

import Foundation

extension Screen {
    // MARK: - iPhones

    /// 6.7" (428 x 926 points @3x)
    /// iPhone 13 Pro Max, iPhone 12 Pro Max
    static let iPhone67 = Screen(width: 428, height: 926)

    /// 6.5" (414 x 896 points @3x)
    /// iPhone 11 Pro Max, iPhone XS Max
    static let iPhone65 = Screen(width: 414, height: 896)

    // 6.1" (390 x 844 points @3x)
    // iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
    static let iPhone61b = Screen(width: 390, height: 844)

    /// 6.1" (414 x 896 points @2x)
    /// iPhone 11, iPhone XR
    static let iPhone61a = Screen(width: 414, height: 896)

    /// 5.4" (375 x 812 points @3x) 5.8" (375 x 812 points @3x)
    /// iPhone 13 mini, iPhone 12 mini, iPhone 11 Pro, iPhone XS, iPhone X
    static let iPhone54_58 = Screen(width: 375, height: 812)

    /// 5.5" (414 x 736 points @3x)
    /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
    static let iPhone55 = Screen(width: 414, height: 737)

    /// 4.7" (375 x 667 points @2x)
    /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
    static let iPhone47 = Screen(width: 375, height: 667)

    /// 4" (320 x 568 @2x)
    /// iPhone SE (1st Gen), iPod Touch (7th Gen)
    static let iPhone4 = Screen(width: 320, height: 568)

    // MARK: - iPads

    /// 12.9" (1024 x 1366 points @2x)
    /// iPad Pro 12.9" (1st - 5th generation)
    static let iPad129 = Screen(width: 1024, height: 1366)

    /// 11" (834 x 1194 points @2x)
    /// iPad Pro 11" (3rd, 4th, 5th generation)
    static let iPad11 = Screen(width: 834, height: 1194)

    /// 10.9" (820 x 1180 points @2x)
    /// iPad Air (4th, 5th generation)
    static let iPad109 = Screen(width: 820, height: 1180)

    /// 10.5" (834 x 1112 points @2x)
    /// iPad Air (3rd generation), iPad Pro 10.5" (2nd generation)
    static let iPad105 = Screen(width: 834, height: 1112)

    /// 10.2" (810 x 1080 @2x)
    /// iPad (7th, 8th, 9th generation)
    static let iPad102 = Screen(width: 810, height: 1080)

    /// 9.7" (768 x 1024 points @2x)
    /// iPad (5th, 6th generation), iPad Pro 9.7" (1st generation), iPad Air 2
    static let iPad97 = Screen(width: 768, height: 1024)

    /// 8.3" (744 x 1133 @2x)
    /// iPad Mini (6th generation)
    static let iPad83 = Screen(width: 744, height: 1133)

    /// 7.9" (768 x 1024 points @2x)
    /// iPad Mini (5th generation), iPad Mini 4
    static let iPad79 = Screen(width: 768, height: 1024)
}
