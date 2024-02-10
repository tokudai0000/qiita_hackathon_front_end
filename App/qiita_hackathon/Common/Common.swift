//
//  Common.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

struct Common {

    func convertImageToBase64(_ image: UIImage) -> String? {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else { return nil }
        return imageData.base64EncodedString()
    }

    func convertBase64ToImage(_ base64String: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: base64String) else { return nil }
        return UIImage(data: imageData)
    }

    let sampleUserData: User = User(id: "uuid0123456789",
                                    iconImage: "",
                                    userName: "akidon0000",
                                    companionDrink: 0,
                                    totalTime: "001024",
                                    snsLink: "https://github.com/akidon0000",
                                    entryTime: "20240210101310",
                                    lang: 0)

    let sampleUsersData: [User] = [
        User(id: "uuid0123456789",
             iconImage: "",
             userName: "akidon0000",
             companionDrink: 0,
             totalTime: "001024",
             snsLink: "https://github.com/akidon0000",
             entryTime: "20240210101310",
             lang: 0),

        User(id: "uuidabcdefg",
             iconImage: "",
             userName: "hinakko",
             companionDrink: 2,
             totalTime: "010850",
             snsLink: "https://github.com/hinakko",
             entryTime: "20240210101310",
             lang: 1),
    ]
}
