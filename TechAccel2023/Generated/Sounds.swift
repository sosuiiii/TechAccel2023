// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length line_length implicit_return

// MARK: - Files

// swiftlint:disable explicit_type_interface identifier_name
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Files {
  /// 01opening.wav
  internal static let _01openingWav = File(name: "01opening", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// 04okid.wav
  internal static let _04okidWav = File(name: "04okid", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// 07battle_to_wild.wav
  internal static let _07battleToWildWav = File(name: "07battle_to_wild", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// 08win_to_wild.wav
  internal static let _08winToWildWav = File(name: "08win_to_wild", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// 09nibi_city.wav
  internal static let _09nibiCityWav = File(name: "09nibi_city", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// 41evolution.wav
  internal static let _41evolutionWav = File(name: "41evolution", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// fushigidane.wav
  internal static let fushigidaneWav = File(name: "fushigidane", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// hitokage.wav
  internal static let hitokageWav = File(name: "hitokage", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// select.wav
  internal static let selectWav = File(name: "select", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
  /// zenigame.wav
  internal static let zenigameWav = File(name: "zenigame", ext: "wav", relativePath: "", mimeType: "audio/vnd.wave")
}
// swiftlint:enable explicit_type_interface identifier_name
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

internal struct File {
  internal let name: String
  internal let ext: String?
  internal let relativePath: String
  internal let mimeType: String

  internal var url: URL {
    return url(locale: nil)
  }

  internal func url(locale: Locale?) -> URL {
    let bundle = BundleToken.bundle
    let url = bundle.url(
      forResource: name,
      withExtension: ext,
      subdirectory: relativePath,
      localization: locale?.identifier
    )
    guard let result = url else {
      let file = name + (ext.flatMap { ".\($0)" } ?? "")
      fatalError("Could not locate file named \(file)")
    }
    return result
  }

  internal var path: String {
    return path(locale: nil)
  }

  internal func path(locale: Locale?) -> String {
    return url(locale: locale).path
  }
}

// swiftlint:disable convenience_type explicit_type_interface
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type explicit_type_interface
