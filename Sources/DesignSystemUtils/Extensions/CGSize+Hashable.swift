//
//  CGSize+Hashable.swift
//  
//
//  Created by Karolina Samorek on 10/05/2022.
//

import CoreGraphics

extension CGSize: Hashable {
    /// Hashes the width and height by feeding them into the
    /// given hasher.
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
}
