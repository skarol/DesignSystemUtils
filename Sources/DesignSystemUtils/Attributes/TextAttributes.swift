//
//  TextAttributes.swift
//  
//
//  Created by Karolina Samorek on 10/05/2022.
//

import SwiftUI

/// UI Attributes that can be applied on a text to change it visually.
public struct TextAttributes: Equatable, Hashable {
    /// Text Font.
    public var font: DSFont
    /// Text Font.
    public var color: DSColor
    /// Text Alignment. Wont't be set if ``nil``.
    public var alignment: TextAlignment?
    /// Text Line Spacing. Wont't be set if ``nil``.
    public var lineSpacing: CGFloat?

    /// Creates UI Attributes that can be applied on a text to change it visually.
    /// - Parameters:
    ///   - font: Text Font.
    ///   - color: Text Font.
    ///   - alignment: Text Alignment. Default to ``nil``, wont't be set.
    ///   - lineSpacing: Text Line Spacing. Default to ``nil``, wont't be set.
    public init(font: DSFont, color: DSColor, alignment: TextAlignment? = nil, lineSpacing: CGFloat? = nil) {
        self.font = font
        self.color = color
        self.alignment = alignment
        self.lineSpacing = lineSpacing
    }
}
