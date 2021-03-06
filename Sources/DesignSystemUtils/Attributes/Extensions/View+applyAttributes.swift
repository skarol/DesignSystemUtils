//
//  View+applyAttributes.swift
//
//
//  Created by Karolina Samorek on 11/05/2022.
//

import SwiftUI

public extension View {
    /// Applies UI attributes for given view.
    /// - Parameter viewAttributes: The ``ViewAttributes`` to apply.
    /// - Returns: View modified visually.
    @ViewBuilder func apply(viewAttributes: ViewAttributes?) -> some View {
        if let viewAttributes = viewAttributes {
            let attributedView = self.if(viewAttributes.backgroundColor) { view, backgroundColor in
                view.background(Color(dsColor: backgroundColor))
            }
            .cornerRadius(viewAttributes.cornerRadius ?? 0)
            .if(viewAttributes.borderAttributes) { view, borderAttributes in
                view.apply(borderAttributes: borderAttributes, cornerRadius: viewAttributes.cornerRadius)
            }
            .if(viewAttributes.shadowAttributes) { view, shadowAttributes in
                view.apply(shadowAttributes: shadowAttributes)
            }

            if #available(iOS 15.0, macOS 12.0, tvOS 15.0, *) {
                attributedView.if(viewAttributes.tintColor) { view, tintColor in
                    view.tint(Color(dsColor: tintColor))
                }
            } else {
                attributedView
            }
        } else {
            self
        }
    }

    /// Applies ``TextAttributes`` for given view.
    ///
    /// - Parameters:
    ///   - attributes: The ``TextAttributes`` to apply.
    /// - Returns: Modified View.
    @ViewBuilder func apply(textAttributes: TextAttributes?) -> some View {
        if let textAttributes = textAttributes {
            self.apply(textAttributes: textAttributes)
        } else {
            self
        }
    }

    /// Applies ``TextAttributes`` for given view.
    ///
    /// - Parameters:
    ///   - attributes: The ``TextAttributes`` to apply.
    /// - Returns: Modified View.
    @ViewBuilder func apply(textAttributes: TextAttributes) -> some View {
        self.if(textAttributes.lineSpacing) { view, lineSpacing in
            view.lineSpacing(lineSpacing)
        }
        .font(Font(textAttributes.font))
        .foregroundColor(Color(dsColor: textAttributes.color))
        .if(textAttributes.alignment) { view, alignment in
            view.multilineTextAlignment(alignment)
        }
    }

    /// Applies ``BorderAttributes`` for given view.
    /// - Parameter borderAttributes: The ``BorderAttributes`` to apply.
    /// - Returns: View with modified border.
    @ViewBuilder func apply(borderAttributes: BorderAttributes, cornerRadius: CGFloat?) -> some View {
        if let borderColor = borderAttributes.color {
            self.overlay(
                RoundedRectangle(cornerRadius: cornerRadius ?? 0)
                    .stroke(Color(dsColor: borderColor), lineWidth: borderAttributes.width)
            )
        } else {
            self
        }
    }

    /// Applies ``ShadowAttributes`` for given view.
    /// - Parameter shadowAttributes: The ``ShadowAttributes`` to apply.
    /// - Returns: View with modified shadow.
    @ViewBuilder func apply(shadowAttributes: ShadowAttributes) -> some View {
        self.shadow(
            color: Color(dsColor: shadowAttributes.color).opacity(Double(shadowAttributes.opacity)),
            radius: shadowAttributes.radius,
            x: shadowAttributes.offset.width,
            y: shadowAttributes.offset.height
        )
    }
}
