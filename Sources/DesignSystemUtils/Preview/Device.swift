//
//  Device.swift
//  
//
//  Created by Karolina Samorek on 11/05/2022.
//

#if DEBUG
import Foundation
import SwiftUI

/// The device to display preview on.
///
/// Created for Preview usage. Possible to use only on debug build.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
public struct Device: Identifiable {
    /// The id contracted from ``PreviewDevice`` and ``InterfaceOrientation``.
    public var id: String {
        "\(name.rawValue)-\(interfaceOrientation.id)"
    }

    /// The Device's name.
    public let name: PreviewDevice
    /// The Device's ``Screen``.
    public let screen: Screen
    /// The Device's ``InterfaceOrientation``.
    public var interfaceOrientation: InterfaceOrientation = .portrait

    /// The DEvice's layout.
    public var layout: Layout {
        Layout(screen: screen)
    }

    private init(name: PreviewDevice, screen: Screen) {
        self.name = name
        self.screen = screen
    }

    /// Wraps view inside ``PreviewDevice`` with specified ``interfaceOrientation``.
    ///
    /// Also inject proper Layout Environment Object.
    /// - Parameter content: The content view to be displayed inside ``PreviewDevice``.
    /// - Returns: Content view wrapped inside ``PreviewDevice`` with specified ``interfaceOrientation`` and injected proper Layout Environment Object.
    public func makeView<Content: View>(_ content: Content) -> some View {
        content
            .previewDevice(name)
            .previewInterfaceOrientation(interfaceOrientation)
            .environmentObject(Layout(screen: screen.rotate(to: interfaceOrientation)))
    }

    /// Changes device screen orientation to provided one.
    /// - Parameter interfaceOrientation: ``InterfaceOrientation`` the device will be rotated to.
    /// - Returns: Device with changes ``interfaceOrientation`` property.
    public func rotate(to interfaceOrientation: InterfaceOrientation) -> Device {
        var rotatedDevice = self
        rotatedDevice.interfaceOrientation = interfaceOrientation
        return rotatedDevice
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
extension Device {
    public static let basic: [Device] = [
        .iPhone_SE_1st_gen,
        .iPhone_12,
        .iPad_9th_gen,
        .iPad_mini_6th_gen.rotate(to: .landscapeLeft),
    ]

    public static let iPhones: [Device] = [
        .iPhone_SE_1st_gen,
        .iPhone_SE_3rd_gen,
        .iPhone_13_mini,
        .iPhone_12,
        .iPhone_13_Pro_max
    ]

    public static let iPadsPortrait: [Device] = [
        .iPad_mini_6th_gen,
        .iPad_9th_gen,
        .iPad_Pro_129_5th_gen
    ]

    public static let iPadsLandscape: [Device] = [
        .iPad_mini_6th_gen.rotate(to: .landscapeLeft),
        .iPad_9th_gen.rotate(to: .landscapeLeft),
        .iPad_Pro_129_5th_gen.rotate(to: .landscapeLeft)
    ]

    // MARK: - iPhones

    public static let iPhone_SE_1st_gen = Device(name: "iPhone SE (1st generation)", screen: .iPhone4)
    public static let iPhone_SE_3rd_gen = Device(name: "iPhone SE (3rd generation)", screen: .iPhone47)
    public static let iPhone_12 = Device(name: "iPhone 12", screen: .iPhone61b)
    public static let iPhone_13_mini = Device(name: "iPhone 13 mini", screen: .iPhone54_58)
    public static let iPhone_13_Pro_max = Device(name: "iPhone 13 Pro Max", screen: .iPhone67)

    // MARK: - iPads

    public static let iPad_mini_6th_gen = Device(name: "iPad mini (6th generation)", screen: .iPad83)
    public static let iPad_Air_4th_gen = Device(name: "iPad Air (4th generation)", screen: .iPad109)
    public static let iPad_9th_gen = Device(name: "iPad (9th generation)", screen: .iPad102)
    public static let iPad_Pro_129_5th_gen = Device(name: "iPad Pro (12.9-inch) (5th generation)", screen: .iPad129)
}
#endif
