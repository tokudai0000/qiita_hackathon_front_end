//
//  User.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

struct User: Decodable {
    let id: String
    let iconImage: String
    let userName: String
    let companionDrink: Int
    let programLangs: [ProgramLang]
    let snsLinks: [SnsLink]

    init(id: String, iconImage: String, userName: String, companionDrink: Int, programLangs: [ProgramLang], snsLinks: [SnsLink]) {
        self.id = id
        self.iconImage = iconImage
        self.userName = userName
        self.companionDrink = companionDrink
        self.programLangs = programLangs
        self.snsLinks = snsLinks
    }

    enum ParsingError: Error {
        case invalidData
    }

    init(dictionary: [String: Any]) throws {
        guard let id = dictionary["id"] as? String,
              let iconImage = dictionary["iconImage"] as? String,
              let userName = dictionary["userName"] as? String,
              let companionDrink = dictionary["companionDrink"] as? Int,
              let programLangs = dictionary["programLangs"] as? [ProgramLang],
              let snsLinks = dictionary["snsLinks"] as? [SnsLink] else {
            throw ParsingError.invalidData
        }
        self.id = id
        self.iconImage = iconImage
        self.userName = userName
        self.companionDrink = companionDrink
        self.programLangs = programLangs
        self.snsLinks = snsLinks
    }
}
