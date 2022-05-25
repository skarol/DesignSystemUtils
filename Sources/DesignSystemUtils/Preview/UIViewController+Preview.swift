//
//  UIViewController+Preview.swift
//
//
//  Created by Karolina Samorek on 15/05/2022.
//

#if canImport(UIKit) && !os(watchOS)
import SwiftUI
import UIKit

public extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context _: Context) -> UIViewController {
            viewController
        }

        func updateUIViewController(_: UIViewController, context _: Context) { }
    }

    /// Converts ``UIViewController`` to ``SwiftUI.View`` in order to show it in preview.
    /// - Returns: ``SwiftUI.View`` that can be previewed.
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}

#endif
