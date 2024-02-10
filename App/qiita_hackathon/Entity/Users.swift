//
//  Users.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

struct Users: Decodable {
    let users: [User]

    init(users: [User]) {
        self.users = users
    }
}
