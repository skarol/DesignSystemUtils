//
//  SizeVariants+Modifications.swift
//
//
//  Created by Karolina Samorek on 12/05/2022.
//

import Foundation

public extension SizeVariants {
    /// Modifies Variants at keypath with given values.
    /// - Parameters:
    ///   - keyPath: The keypath which values will be modified.
    ///   - valueVariants: Value Variants to apply on each Variant
    /// - Returns: Modified Variants with given values.
    func modify<PropertyType>(
        keyPath: WritableKeyPath<Variant, PropertyType>,
        valueVariants: SizeVariants<PropertyType>
    ) -> SizeVariants<Variant> {
        var modified = self

        modified.small[keyPath: keyPath] = valueVariants.small
        modified.short[keyPath: keyPath] = valueVariants.short
        modified.compact[keyPath: keyPath] = valueVariants.compact
        modified.regular[keyPath: keyPath] = valueVariants.regular
        modified.wide[keyPath: keyPath] = valueVariants.wide

        return modified
    }

    /// Modifies Variants at keypath with given value.
    /// - Parameters:
    ///   - keyPath: The keypath which values will be modified.
    ///   - value: Value to apply on ALL Variants.
    /// - Returns: Modified Variants with given value.
    func modify<PropertyType>(
        keyPath: WritableKeyPath<Variant, PropertyType>,
        value: PropertyType
    ) -> SizeVariants<Variant> {
        modify(keyPath: keyPath, valueVariants: SizeVariants<PropertyType>(regular: value))
    }

    /// Converts SizeVariants of one type to SizeVariants of another type/
    /// - Parameter convertFn: The convert function.
    /// - Returns: SizeVariants of new type.
    func convert<NewVariant>(_ convertFn: (Variant) -> NewVariant) -> SizeVariants<NewVariant> {
        let smallVariant = convertFn(small)
        let shortVariant = convertFn(short)
        let compactVariant = convertFn(compact)
        let regularVariant = convertFn(regular)
        let wideVariant = convertFn(wide)
        return SizeVariants<NewVariant>(
            small: smallVariant,
            short: shortVariant,
            compact: compactVariant,
            regular: regularVariant,
            wide: wideVariant
        )
    }

    /// Extract value under keypath for each Variant and convert it to SizeVariants type.
    ///
    /// Example usage:
    /// ```
    /// let viewAttributesVariants = SizeVariants<ViewAttributes>(
    ///     compact: ViewAttributes(cornerRadius: 8),
    ///     regular: ViewAttributes(cornerRadius: 16)
    /// )
    ///
    /// let cornerRadiusVariants: SizeVariants<CGFloat?> = viewAttributesVariants.extract(keyPath: \.cornerRadius)
    ///
    /// ```
    /// - Parameter keyPath: The keypath which values will be extracted.
    /// - Returns: SizeVariants of values for given keypath.
    func extract<PropertyType>(keyPath: KeyPath<Variant, PropertyType>) -> SizeVariants<PropertyType> {
        let smallVariant = small[keyPath: keyPath]
        let shortVariant = short[keyPath: keyPath]
        let compactVariant = compact[keyPath: keyPath]
        let regularVariant = regular[keyPath: keyPath]
        let wideVariant = wide[keyPath: keyPath]

        return SizeVariants<PropertyType>(
            small: smallVariant,
            short: shortVariant,
            compact: compactVariant,
            regular: regularVariant,
            wide: wideVariant
        )
    }
}
