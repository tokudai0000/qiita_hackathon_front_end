//
//  UsersUpdateGetAPI.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/11.
//

import APIKit

protocol UsersUpdateGetAPIInterface {
    func getUsersUpdate(completion: @escaping (Result<UsersUpdateGetRequest.Response, Error>) -> Void)
}

struct UsersUpdateGetAPI: UsersUpdateGetAPIInterface {
    init() {}

    func getUsersUpdate(completion: @escaping (Result<UsersUpdateGetRequest.Response, Error>) -> Void) {
        let request = UsersUpdateGetRequest()
        Session.send(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let sessionTaskError):
                // SessionTaskErrorをErrorプロトコルに適合させる
                let error: Error = sessionTaskError as Error
                completion(.failure(error))
            }
        }
    }
}

struct UsersUpdateGetRequest: Request {
    struct ResponseBody {
        let users: Users

        init(object: Any) throws {
            guard let dictionary = object as? [String: Any],
                  let usersArray = dictionary["users"] as? [[String: Any]] else {
                throw ResponseError.unexpectedObject(object)
            }

            let userItems = try usersArray.map { try User(dictionary: $0) }
            users = Users(users: userItems)
        }
    }

    typealias Response = ResponseBody

    var baseURL: URL {
        return URL(string: "https://us-central1-tokumemoqiita.cloudfunctions.net")!
    }

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/Update"
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response(object: object)
    }
}
