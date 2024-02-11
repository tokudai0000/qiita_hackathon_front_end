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

    let iconList = ["Image1", "Image2", "Image3", "Image4", "Image5", "Image6"]
    let drinkList = ["コーヒー", "エナジードリンク", "紅茶", "お茶", "ジュース", "水"]
    let langList = ["Swift", "Kotlin", "Flutter", "C言語", "Python", "Go言語", "PHP", "R言語"]

    let sampleUserData: User = User(id: "uuid0123456789",
                                    iconImage: "Image1",
                                    userName: "akidon",
                                    companionDrink: "ジュース",
                                    totalTime: "001024",
                                    snsLink: "https://github.com/akidon0000",
                                    entryTime: "20240210101310",
                                    lang: "Swift")

    let sampleUsersData: Users = Users(users:[
        User(id: "uuid0123456789",
             iconImage: "Image1",
             userName: "akidon",
             companionDrink: "ジュース",
             totalTime: "001024",
             snsLink: "https://github.com/akidon0000",
             entryTime: "20240210101310",
             lang: "Swift"),

        User(id: "uuid057859000",
             iconImage: "Image2",
             userName: "Hika",
             companionDrink: "紅茶",
             totalTime: "001024",
             snsLink: "https://github.com/akidon0000",
             entryTime: "20240210101310",
             lang: "Python"),
        User(id: "uuid3246678",
             iconImage: "Image4",
             userName: "horry",
             companionDrink: "コーヒー",
             totalTime: "001024",
             snsLink: "https://github.com/akidon0000",
             entryTime: "20240210101310",
             lang: "Python")
    ])

    

}
