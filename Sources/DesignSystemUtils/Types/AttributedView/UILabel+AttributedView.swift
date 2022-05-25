//
//  UILabel+AttributedView.swift
//  
//
//  Created by Karolina Samorek on 11/05/2022.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit
import SwiftUI
import Combine

extension UILabel: AttributedView {
    public typealias Attributes = TextAttributes

    /// Starts updating stream of attributes on itself.
    /// - Parameters:
    ///   - attributes: The stream of attributes to apply.
    ///   - cancellables: Cancellable Set to store updates on.
    public func startUpdating(attributes: AnyPublisher<Attributes, Never>, store cancellables: inout Set<AnyCancellable>) {
        attributes
            .sink(receiveValue: apply(attributes:))
            .store(in: &cancellables)
    }

    /// Applies Text Attributes for given label.
    /// - Parameter attributes: The Text Attributes to apply on a label.
    internal func apply(attributes: TextAttributes) {
        font = attributes.font
        textColor = UIColor(dsColor: attributes.color)

        if let text = text, !text.isEmpty {
            let attributedString = NSMutableAttributedString(string: text)

            let paragraphStyle = NSMutableParagraphStyle()
            if let paragraph = self.attributedText?.attribute(NSAttributedString.Key.paragraphStyle, at: 0, effectiveRange: nil)
                as? NSParagraphStyle {
                paragraphStyle.setParagraphStyle(paragraph)
            }

            if let lineSpacing = attributes.lineSpacing {
                paragraphStyle.lineSpacing = lineSpacing
            }
            if let textAlignment = attributes.alignment {
                paragraphStyle.alignment = NSTextAlignment(textAlignment: textAlignment)
            }

            var range = NSRange(location: 0, length: 0)
            attributedString.attributes(at: 0, effectiveRange: &range)
            attributedString.setAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: range)

            attributedString.addAttribute(.font, value: attributes.font, range: NSRange(location: 0, length: attributedString.length))

            attributedString.addAttribute(.foregroundColor, value: UIColor(dsColor: attributes.color), range: NSRange(location: 0, length: attributedString.length))

            self.attributedText = attributedString
        }
    }

    public func startUpdating(store cancellables: inout Set<AnyCancellable>) {
    }
}

#endif
