//
//  DateFormatter+Exetnsion.swift
//  AkidonComponents
//
//  Created by Akihiro Matsuyama on 2024/02/01.
//

import Foundation

extension DateFormatter {
    // テンプレートの定義(例)
    enum Template: String {
        case date = "yMd"            // 2017/1/1
        case dateMonthDate = "MMMd"  // 1月1日
        case time = "Hms"            // 12:39:22
        case full = "yMdkHms"        // 2017/1/1 12:39:22
        case onlyHour = "k"          // 17時
        case era = "GG"              // "西暦" (default) or "平成" (本体設定で和暦を指定している場合)
        case weekDay = "EEEE"        // 日曜日
        case iso8601 = "yyyyMMddHHmmss" // 20170101123922
    }

    /*
     使用例
     let dt = Date()
     let dateFormatter = DateFormatter()
     dateFormatter.setTemplate(.dateMonthDate)
     print(dateFormatter.string(from: dt))
     */
    func setTemplate(_ template: Template) {
        // optionsは拡張用の引数だが使用されていないため常に0
        dateFormat = DateFormatter.dateFormat(fromTemplate: template.rawValue, options: 0, locale: .current)
    }


    /*
     let dt = Date()
     // String型へ変換
     let dateString = DateFormatter.yyyyMMddHHmmss.string(from: dt)

     // DateFormatter.yyyyMMddHHmmssを使用してDate型へ変換
     if let date = DateFormatter.yyyyMMddHHmmss.date(from: dateString) {
     */
    static let yyyyMMddHHmmss: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    static let HHmmss: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmmss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
