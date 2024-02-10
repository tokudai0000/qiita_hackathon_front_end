//
//  ProgramLang.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

struct ProgramLang: Decodable {
    let lang: Int
    let timeMinutes: Int

    init(lang: Int, timeMinutes: Int) {
        self.lang = lang
        self.timeMinutes = timeMinutes
    }

    enum ParsingError: Error {
        case invalidData
    }

    init(dictionary: [String: Any]) throws {
        guard let lang = dictionary["lang"] as? Int,
              let timeMinutes = dictionary["timeMinutes"] as? Int else {
            throw ParsingError.invalidData
        }
        self.lang = lang
        self.timeMinutes = timeMinutes
    }
}
