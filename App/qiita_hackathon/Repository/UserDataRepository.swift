//
//  UserDataRepository.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/11.
//

import Foundation

public protocol UserDataRepositoryInterface {
    func fetchUserData() -> User
    func setUserData(_ items: User)
}

public final class UserDataRepository: UserDataRepositoryInterface {

    public init() { }

    private var userDefaults = UserDefaults.standard

    private let KEY_id = "KEY_id"
    private var id: String {
        get { return userDefaults.string(forKey: KEY_id) ?? "" }
        set(v) { userDefaults.set(v ,forKey: KEY_id) }
    }

    private let KEY_iconImage = "KEY_iconImage"
    private var iconImage: String {
        get { return userDefaults.string(forKey: KEY_iconImage) ?? "" }
        set(v) { userDefaults.set(v ,forKey: KEY_iconImage) }
    }

    private let KEY_userName = "KEY_userName"
    private var userName: String {
        get { return userDefaults.string(forKey: KEY_userName) ?? "" }
        set(v) { userDefaults.set(v ,forKey: KEY_userName) }
    }

    private let KEY_companionDrink = "KEY_companionDrink"
    private var companionDrink: String {
        get { return userDefaults.string(forKey: KEY_companionDrink) ?? "" }
        set(v) { userDefaults.set(v ,forKey: KEY_companionDrink) }
    }

    private let KEY_totalTime = "KEY_totalTime"
    private var totalTime: String {
        get { return userDefaults.string(forKey: KEY_totalTime) ?? "" }
        set(v) { userDefaults.set(v ,forKey: KEY_totalTime) }
    }

    private let KEY_snsLink = "KEY_snsLink"
    private var snsLink: String {
        get { return userDefaults.string(forKey: KEY_snsLink) ?? "" }
        set(v) { userDefaults.set(v ,forKey: KEY_snsLink) }
    }

    private let KEY_entryTime = "KEY_entryTime"
    private var entryTime: String {
        get { return userDefaults.string(forKey: KEY_entryTime) ?? "" }
        set(v) { userDefaults.set(v ,forKey: KEY_entryTime) }
    }

    private let KEY_lang = "KEY_lang"
    private var lang: String {
        get { return userDefaults.string(forKey: KEY_lang) ?? "" }
        set(v) { userDefaults.set(v ,forKey: KEY_lang) }
    }

    public func fetchUserData() -> User {
        return User(
            id: id,
            iconImage: iconImage,
            userName: userName,
            companionDrink: companionDrink,
            totalTime: totalTime,
            snsLink: snsLink,
            entryTime: entryTime,
            lang: lang
        )
    }

    public func setUserData(_ items: User) {
        id = items.id
        iconImage = items.iconImage
        userName = items.userName
        companionDrink = items.companionDrink
        totalTime = items.totalTime
        snsLink = items.snsLink
        entryTime = items.entryTime
        lang = items.lang
    }
}
