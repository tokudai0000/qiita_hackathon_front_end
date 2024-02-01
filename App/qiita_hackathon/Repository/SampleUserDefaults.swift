//
//  SampleUserDefaults.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/01.
//

import Foundation

public protocol AcceptedTermVersionRepositoryInterface {
    func fetchAcceptedTermVersion() -> String
    func setAcceptedTermVersion(_ items: String)
}

public final class AcceptedTermVersionOnUserDefaultsRepository: AcceptedTermVersionRepositoryInterface {

    private var acceptedTermVersion: String

    public init() {
        acceptedTermVersion = ""
    }

    private var userDefaults = UserDefaults.standard
    private let KEY_agreementVersion = "KEY_agreementVersion"
    public func fetchAcceptedTermVersion() -> String {
        return userDefaults.string(forKey: KEY_agreementVersion) ?? ""
    }

    public func setAcceptedTermVersion(_ items: String) {
        userDefaults.set(items ,forKey: KEY_agreementVersion)
    }
}
