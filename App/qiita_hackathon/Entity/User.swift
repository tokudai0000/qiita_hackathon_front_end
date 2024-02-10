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
    let companionDrink: String
    let programLangs: [ProgramLang]
    let snsLinks: [SnsLink]

    init(id: String, iconImage: String, userName: String, companionDrink: String, programLangs: [ProgramLang], snsLinks: [SnsLink]) {
        self.id = id
        self.iconImage = iconImage
        self.userName = userName
        self.companionDrink = companionDrink
        self.programLangs = programLangs
        self.snsLinks = snsLinks
    }

//    enum ParsingError: Error {
//        case invalidData
//    }
//
//    init(dictionary: [String: Any]) throws {
//        guard let id = dictionary["id"] as? Int,
//              let clientName = dictionary["clientName"] as? String,
//              let imageUrlStr = dictionary["imageUrlStr"] as? String,
//              let targetUrlStr = dictionary["targetUrlStr"] as? String,
//              let imageDescription = dictionary["imageDescription"] as? String else {
//            throw ParsingError.invalidData
//        }
//        self.id = id
//        self.clientName = clientName
//        self.imageUrlStr = imageUrlStr
//        self.targetUrlStr = targetUrlStr
//        self.imageDescription = imageDescription
//    }
}
