// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

extension Font {
  public static func sfProDisplay(_ style: SFProDisplayStyle, fixedSize: CGFloat) -> Font {
    return Font.custom(style.rawValue, fixedSize: fixedSize)
  }

  public static func sfProDisplay(_ style: SFProDisplayStyle, size: CGFloat, relativeTo textStyle: TextStyle = .body) -> Font {
    return Font.custom(style.rawValue, size: size, relativeTo: textStyle)
  }

  public enum SFProDisplayStyle: String {
    case black = "SFProDisplay-Black"
    case bold = "SFProDisplay-Bold"
    case heavy = "SFProDisplay-Heavy"
    case heavyItalic = "SFProDisplay-HeavyItalic"
    case light = "SFProDisplay-Light"
    case medium = "SFProDisplay-Medium"
    case regular = "SFProDisplay-Regular"
    case semibold = "SFProDisplay-Semibold"
    case semiboldItalic = "SFProDisplay-SemiboldItalic"
    case thin = "SFProDisplay-Thin"
    case ultralight = "SFProDisplay-Ultralight"
  }
}
