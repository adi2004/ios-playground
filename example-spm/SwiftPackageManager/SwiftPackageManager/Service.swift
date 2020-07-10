//
//  Service.swift
//  SwiftPackageManager
//
//  Created by adrian.florescu on 09/07/2020.
//  Copyright © 2020 infloresc. All rights reserved.
//

import Moya
import Foundation

//https://github.com/Moya/Moya.git

enum MyService {
    case get
    case getWithParams(paramA: String, paramB: String)
    case showUser(id: Int)
    case updateUser(id: Int, firstName: String, lastName: String)
    case showAccounts
}

// MARK: - TargetType Protocol Implementation
extension MyService: TargetType {
    var baseURL: URL { return URL(string: "https://postman-echo.com")! }
    var path: String {
        switch self {
        case .get:
            return "/get"
        case .showUser(let id), .updateUser(let id, _, _):
            return "/users/\(id)"
        case .getWithParams(_, _):
            return "/get"
        case .showAccounts:
            return "/accounts"
        }
    }
    var method: Moya.Method {
        switch self {
        case .get, .showUser, .showAccounts:
            return .get
        case .getWithParams, .updateUser:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .get, .showUser, .showAccounts: // Send no parameters
            return .requestPlain
        case let .updateUser(_, firstName, lastName):  // Always sends parameters in URL, regardless of which HTTP method is used
            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
        case let .getWithParams(firstName, lastName): // Always send parameters as JSON in request body
            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
        }
    }
    var sampleData: Data {
        switch self {
        case .get:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        case .showUser(let id):
            return "{\"id\": \(id), \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
        case .getWithParams(let firstName, let lastName):
            return "{\"id\": 100, \"first_name\": \"\(firstName)\", \"last_name\": \"\(lastName)\"}".utf8Encoded
        case .updateUser(let id, let firstName, let lastName):
            return "{\"id\": \(id), \"first_name\": \"\(firstName)\", \"last_name\": \"\(lastName)\"}".utf8Encoded
        case .showAccounts:
            // Provided you have a file named accounts.json in your bundle.
            guard let url = Bundle.main.url(forResource: "accounts", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
