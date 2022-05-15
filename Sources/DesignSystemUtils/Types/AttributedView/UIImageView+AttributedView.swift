//
//  UIImageView+AttributedView.swift
//  
//
//  Created by Karolina Samorek on 15/05/2022.
//

#if canImport(UIKit) && !os(watchOS)
import Combine
import SwiftUI
import UIKit

extension UIImageView: AttributedView {
    public typealias Attributes = ImageAttributes

    /// Starts updating stream of attributes on itself.
    ///
    /// Animates changes.
    /// - Parameters:
    ///   - attributes: The stream of attributes to apply.
    ///   - cancellables: Cancellable Set to store updates on.
    public func startUpdating(attributes: AnyPublisher<Attributes, Never>, store cancellables: inout Set<AnyCancellable>) {
        attributes
            .sink { attributes in
                if let image = attributes.image {
                    self.image = UIImage(dsImage: image)
                }
                self.apply(attributes: attributes.viewAttributes)
            }
            .store(in: &cancellables)
    }
}

#endif
