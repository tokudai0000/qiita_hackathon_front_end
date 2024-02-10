//
//  UserPostAPI.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/11.
//

import APIKit

protocol UserPostAPIInterface {
    func postUserData(user: User, completion: @escaping (Result<UserPostRequest.Response, Error>) -> Void)
}

struct UserPostAPI: UserPostAPIInterface {
    init() {}

    func postUserData(user: User, completion: @escaping (Result<UserPostRequest.Response, Error>) -> Void) {
        let request = UserPostRequest(user: user)
        Session.send(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let sessionTaskError):
                let error: Error = sessionTaskError as Error
                completion(.failure(error))
            }
        }
    }
}

struct UserPostRequest: Request {
//    typealias Response = UserPostResponse
    struct UserPostResponse: Decodable {

    }

    var user: User

    init(user: User) {
        self.user = user
    }

    var baseURL: URL {
        return URL(string: "https://us-central1-tokumemoqiita.cloudfunctions.net")!
    }

    var method: HTTPMethod {
        return .post
    }

    var path: String {
        return "UserRegist"
    }

    var bodyParameters: BodyParameters? {
        let body: [String: Any] = [
            "id": user.id,
            "iconImage": user.iconImage,
            "userName": user.userName,
            "companionDrink": user.companionDrink,
            "totalTime": user.totalTime,
            "snsLink": user.snsLink,
            "entryTime": user.entryTime,
            "lang": user.lang
        ]
        return JSONBodyParameters(JSONObject: body)
    }

    func response(urlResponse: HTTPURLResponse) throws -> HTTPURLResponse {
        return urlResponse
    }
}
