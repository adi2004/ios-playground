//
//  HTTPBinTargetType.swift
//  SwiftPackageManager
//
//  Created by adrian.florescu on 10/07/2020.
//  Copyright © 2020 infloresc. All rights reserved.
//

import Foundation
import Moya

class HTTPBinTargetType: TargetType {
    var baseURL: URL {
        return URL(string: "http://httpbin.org")!
    }
    
    var path: String {
        return "/get"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return Task.requestParameters(parameters: ["a": 1, "b": ["bb": "2"]], encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
