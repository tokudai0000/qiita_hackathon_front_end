//
//  SnsLink.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

struct SnsLink: Decodable {
    let title: String
    let url: String

    init(title: String, url: String) {
        self.title = title
        self.url = url
    }

    enum ParsingError: Error {
        case invalidData
    }

    init(dictionary: [String: Any]) throws {
        guard let title = dictionary["title"] as? String,
              let url = dictionary["url"] as? String else {
            throw ParsingError.invalidData
        }
        self.title = title
        self.url = url
    }
}
