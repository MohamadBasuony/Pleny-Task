// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let actionsIcon = ImageAsset(name: "ActionsIcon")
    internal static let profileImage = ImageAsset(name: "ProfileImage")
    internal static let profileImage2 = ImageAsset(name: "ProfileImage2")
    internal static let profileImage3 = ImageAsset(name: "ProfileImage3")
    internal static let rectangle8 = ImageAsset(name: "Rectangle-8")
    internal static let close = ImageAsset(name: "close")
    internal static let discount = ImageAsset(name: "discount")
    internal static let foodImage1 = ImageAsset(name: "foodImage1")
    internal static let foodImage13 = ImageAsset(name: "foodImage13")
    internal static let foodimage2 = ImageAsset(name: "foodimage2")
    internal static let foodimage3 = ImageAsset(name: "foodimage3")
    internal static let foodimage4 = ImageAsset(name: "foodimage4")
    internal static let foodimage5 = ImageAsset(name: "foodimage5")
    internal static let foodimage6 = ImageAsset(name: "foodimage6")
    internal static let foodimage7 = ImageAsset(name: "foodimage7")
    internal static let foodimage8 = ImageAsset(name: "foodimage8")
    internal static let foodimage9 = ImageAsset(name: "foodimage9")
    internal static let gallery = ImageAsset(name: "gallery")
    internal static let hidePassword = ImageAsset(name: "hidePassword")
    internal static let home = ImageAsset(name: "home")
    internal static let loginImage = ImageAsset(name: "loginImage")
    internal static let logo = ImageAsset(name: "logo")
    internal static let profile = ImageAsset(name: "profile")
    internal static let search = ImageAsset(name: "search")
    internal static let shop = ImageAsset(name: "shop")
    internal static let showPassword = ImageAsset(name: "showPassword")
  }
  internal enum Colors {
    internal static let grey600 = ColorAsset(name: "Grey  600")
    internal static let grey700 = ColorAsset(name: "Grey  700")
    internal static let grey900 = ColorAsset(name: "Grey  900")
    internal static let grey300 = ColorAsset(name: "Grey 300")
    internal static let iconTint = ColorAsset(name: "IconTint")
    internal static let primaryColor = ColorAsset(name: "Primary color")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  fileprivate let name: String

  internal var color: Color {
    Color(self)
  }
}

internal extension Color {
  /// Creates a named color.
  /// - Parameter asset: the color resource to lookup.
  init(_ asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

internal struct ImageAsset {
  fileprivate let name: String

  internal var image: Image {
    Image(name)
  }
}

internal extension Image {
  /// Creates a labeled image that you can use as content for controls.
  /// - Parameter asset: the image resource to lookup.
  init(_ asset: ImageAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

private final class BundleToken {}
