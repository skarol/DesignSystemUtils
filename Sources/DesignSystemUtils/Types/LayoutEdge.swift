//
//  LayoutEdge.swift
//  
//
//  Created by Karolina Samorek on 12/04/2022.
//

import Foundation
import CoreGraphics

/// Defines possible Layout Edges.
public struct LayoutEdge: OptionSet, Hashable {
    /// The top Layout Edge.
    public static let top = LayoutEdge(rawValue: 1)
    /// The leading Layout Edge.
    public static let leading = LayoutEdge(rawValue: 2)
    /// The bottom Layout Edge.
    public static let bottom = LayoutEdge(rawValue: 4)
    /// The trailing Layout Edge.
    public static let trailing = LayoutEdge(rawValue: 8)

    /// The vertical (top + bottom) Layout Edges.
    public static let vertical: LayoutEdge = [.top, .bottom]
    /// The vertical (leading + trailing) Layout Edges.
    public static let horizontal: LayoutEdge = [.leading, .trailing]
    /// All (top + leading + bottom + trailing) Layout Edges.
    public static let all: LayoutEdge = [.top, .leading, .bottom, .trailing]
    /// None of Layout Edges.
    public static let none: LayoutEdge = []

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public typealias LayoutEdgeInsets = [LayoutEdge: CGFloat]

extension LayoutEdgeInsets {
    public static let none: LayoutEdgeInsets = [:]
}
