//
//  Fonts.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 18/09/2023.
//

import Foundation
import SwiftUI

enum FontStyle {
    case Bold
    case Light
    case Medium
    case Regular
    case SemiBold
    case Thin
}

extension Font {
    static func appFont(fontStyle : FontStyle , size : CGFloat) -> Font {
        
        switch fontStyle {
        case .Bold:
            return Font.sfProDisplay(.bold, fixedSize: size)
            
        case .Light:
            return Font.sfProDisplay(.light, fixedSize: size)

        case .Medium:
            return Font.sfProDisplay(.medium, fixedSize: size)

        case .Regular:
            return Font.sfProDisplay(.regular, fixedSize: size)

        case .SemiBold:
            return Font.sfProDisplay(.semibold, fixedSize: size)

        case .Thin:
            return Font.sfProDisplay(.thin, fixedSize: size)

        }

    }
}
