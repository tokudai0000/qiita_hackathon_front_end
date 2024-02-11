//
//  User.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import Foundation

public struct User: Decodable {
    public let id: String
    public let iconImage: String
    public let userName: String
    public let companionDrink: String
    public let totalTime: String
    public let snsLink: String
    public let entryTime: String
    public let lang: String

    public init(id: String, iconImage: String, userName: String, companionDrink: String, totalTime: String, snsLink: String, entryTime: String, lang: String) {
        self.id = id
        self.iconImage = iconImage
        self.userName = userName
        self.companionDrink = companionDrink
        self.totalTime = totalTime
        self.snsLink = snsLink
        self.entryTime = entryTime
        self.lang = lang
    }

    enum ParsingError: Error {
        case invalidData
    }

    init(dictionary: [String: Any]) throws {
        guard let id = dictionary["id"] as? String,
              let iconImage = dictionary["iconImage"] as? String,
              let userName = dictionary["userName"] as? String,
              let companionDrink = dictionary["companionDrink"] as? String,
              let totalTime = dictionary["totalTime"] as? String,
              let snsLink = dictionary["snsLink"] as? String,
              let entryTime = dictionary["entryTime"] as? String,
              let lang = dictionary["lang"] as? String else {
            throw ParsingError.invalidData
        }
        self.id = id
        self.iconImage = iconImage
        self.userName = userName
        self.companionDrink = companionDrink
        self.totalTime = totalTime
        self.snsLink = snsLink
        self.entryTime = entryTime
        self.lang = lang
    }
}
