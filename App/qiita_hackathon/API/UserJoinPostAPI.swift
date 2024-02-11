//
//  UserJoinPostAPI.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/11.
//

import APIKit

protocol UserJoinPostAPIInterface {
    func postUserJoin(id: String, completion: @escaping (Result<Void, Error>) -> Void)
}

struct UserJoinPostAPI: UserJoinPostAPIInterface {
    init() {}

    func postUserJoin(id: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let request = UserJoinPostRequest(id: id)
        Session.send(request) { result in
            switch result {
            case .success:
                completion(.success(())) // 成功した場合、空の成功を返す
            case .failure(let sessionTaskError):
                // SessionTaskErrorをErrorプロトコルに適合させる
                let error: Error = sessionTaskError as Error
                completion(.failure(error))
            }
        }
    }
}

struct UserJoinPostRequest: Request {
    let id: String

    var headerFields: [String : String] {
        return [
            "Content-Type": "application/json"
        ]
    }

    typealias Response = Void // レスポンスが不要なため、Voidを使用

    var baseURL: URL {
        return URL(string: "https://us-central1-tokumemoqiita.cloudfunctions.net")!
    }

    var method: HTTPMethod {
        return .post
    }

    var path: String {
        return "/UserJoin"
    }

    var parameters: Any? {
        return ["id": id]
    }

    var bodyParameters: BodyParameters? {
        guard let parameters = parameters as? [String: Any] else { return nil }
        return JSONBodyParameters(JSONObject: parameters)
    }

}
