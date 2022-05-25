//
//  DSFont.swift
//  
//
//  Created by Karolina Samorek on 10/05/2022.
//

#if canImport(UIKit)
import UIKit

public typealias DSFont = UIFont

#elseif canImport(AppKit)
import AppKit

public typealias DSFont = NSFont

#endif
