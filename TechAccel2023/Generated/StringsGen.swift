// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// はじめから
  internal static let beginning = L10n.tr("text", "beginning", fallback: "はじめから")
  /// フシギダネ
  internal static let bulbasaur = L10n.tr("text", "bulbasaur", fallback: "フシギダネ")
  /// ヒトカゲ
  internal static let charmander = L10n.tr("text", "charmander", fallback: "ヒトカゲ")
  /// %@、きみに きめた！
  internal static func choicedPokemon(_ p1: Any) -> String {
    return L10n.tr("text", "choicedPokemon!", String(describing: p1), fallback: "%@、きみに きめた！")
  }
  /// ▶︎ポケモンをえらぶ
  internal static let choicePokemon = L10n.tr("text", "choicePokemon", fallback: "▶︎ポケモンをえらぶ")
  /// つづきから
  internal static let continuation = L10n.tr("text", "continuation", fallback: "つづきから")
  /// %@にするかい？。
  internal static func getPokemon(_ p1: Any) -> String {
    return L10n.tr("text", "getPokemon?", String(describing: p1), fallback: "%@にするかい？。")
  }
  /// ゼニガメ
  internal static let squirtle = L10n.tr("text", "squirtle", fallback: "ゼニガメ")
  /// ▶︎ぼうけんをはじめる
  internal static let startAdventure = L10n.tr("text", "startAdventure", fallback: "▶︎ぼうけんをはじめる")
  /// text.strings
  ///   TechAccel2023
  /// 
  ///   Created by 田中 颯志 on 9/9/23.
  internal static let startButton = L10n.tr("text", "startButton", fallback: "PUSH START BUTTON")
  /// ポケットモンスターの せかい へ ようこそ！ さっそくだが、いっしょにぼうけんにでかける　ポケモンを　えらんでもらえないか？。
  internal static let startOkid = L10n.tr("text", "startOkid", fallback: "ポケットモンスターの せかい へ ようこそ！ さっそくだが、いっしょにぼうけんにでかける　ポケモンを　えらんでもらえないか？。")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
