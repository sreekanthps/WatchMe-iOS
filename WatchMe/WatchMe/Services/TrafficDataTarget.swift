//
//  TrafficDataTarget.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Moya

public enum TrafficDataTarget {
    case getTrafficData(parameters: [String: String])
}

extension TrafficDataTarget: TargetType {
    public var task: Task {
        switch self {
        case .getTrafficData(parameters: let parameters):
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        }
    }
    
    public var baseURL: URL { return URL(string: Constants.baseURL)! }
    public var path: String {
        switch self {
        case .getTrafficData:
            return "v1/transport/traffic-images/"
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var sampleData: Data {
        Data()
    }
 
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    public var headers: [String: String]? {
        return nil
    }
}
