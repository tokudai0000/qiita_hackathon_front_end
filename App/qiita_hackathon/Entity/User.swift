//
//  User.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import Foundation

struct User: Decodable {
    let id: String
    let iconImage: String
    let userName: String
    let companionDrink: Int
    let totalTime: String
    let snsLink: String
    let entryTime: String
    let lang: Int

    init(id: String, iconImage: String, userName: String, companionDrink: Int, totalTime: String, snsLink: String, entryTime: String, lang: Int) {
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
              let companionDrink = dictionary["companionDrink"] as? Int,
              let totalTime = dictionary["totalTime"] as? String,
              let snsLink = dictionary["snsLink"] as? String,
              let entryTime = dictionary["entryTime"] as? String,
              let lang = dictionary["lang"] as? Int else {
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
