//
//  TrafficService.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation
import Moya
// MARK: - TrafficServiceProtocol
public protocol TrafficServiceProtocol {
    func getTrafficData(for timeStamp: String)
}
// MARK: - TrafficeResponseProtocol
public protocol TrafficeResponseProtocol {
    func returnTrafficData(data: TrafficInfo?)
    func returnErrorReponse(error: Error)
}

public struct TrafficService: TrafficServiceProtocol {
    
    let provider: MoyaProvider<TrafficDataTarget>
    var delegate:TrafficeResponseProtocol?
    init(provider: MoyaProvider<TrafficDataTarget>, delegate: TrafficeResponseProtocol){
        self.provider = provider
        self.delegate = delegate
    }
    public func getTrafficData(for timeStamp: String)  {
        var trafficInfo: TrafficInfo?
        self.provider.request(TrafficDataTarget.getTrafficData(parameters: ["date_time": timeStamp])) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        decoder.dateDecodingStrategy = .formatted(Constants.dateFormatter)
                        trafficInfo = try filteredResponse.map(TrafficInfo.self,using: decoder) // Map repsone to Entitiry
                        delegate?.returnTrafficData(data: trafficInfo)
                        
                    }
                    catch let error {
                        delegate?.returnErrorReponse(error: error)
                        // Here we get either statusCode error or objectMapping error.
                        // TODO: handle the error == best. comment. ever.
                    }
                case let .failure(error):
                    print("Error Data")
                    delegate?.returnErrorReponse(error: error)
                    // TODO: handle the error == best. comment. ever.
                }
        }
        
    
    }
    
    
}
