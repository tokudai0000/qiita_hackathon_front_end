//
//  AdItemsAPI.swift
//  API
//
//  Created by Akihiro Matsuyama on 2024/02/01.
//

// sampleAPI

import APIKit

protocol AdItemsAPIInterface {
    func getAdItems(completion: @escaping (Result<AdItemsGetRequest.Response, Error>) -> Void)
}

struct AdItemsAPI: AdItemsAPIInterface {
    init() {}

    func getAdItems(completion: @escaping (Result<AdItemsGetRequest.Response, Error>) -> Void) {
        let request = AdItemsGetRequest()
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

struct AdItemsGetRequest: Request {
    struct ResponseBody {
        let adItems: AdItems

        init(object: Any) throws {
            guard let dictionary = object as? [String: Any],
                  let prItemsArray = dictionary["prItems"] as? [[String: Any]],
                  let univItemsArray = dictionary["univItems"] as? [[String: Any]] else {
                throw ResponseError.unexpectedObject(object)
            }

            let prItems = try prItemsArray.map { try AdItem(dictionary: $0) }
            let univItems = try univItemsArray.map { try AdItem(dictionary: $0) }
            adItems = AdItems(prItems: prItems, univItems: univItems)
        }
    }

    typealias Response = ResponseBody

    var baseURL: URL {
        return URL(string: "https://tokudai0000.github.io")!
    }

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/tokumemo_resource/api/v1/ad_items.json"
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response(object: object)
    }
}
