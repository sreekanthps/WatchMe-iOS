//
//  ConcreteProviderFactory.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation
import Moya

protocol ProvderFactory {
    var trafficDataProvider: MoyaProvider<TrafficDataTarget> { get }
}
struct ConcreteProviderFactory: ProvderFactory {
    private static var instance = ConcreteProviderFactory()
    public static var shared : ConcreteProviderFactory {
        return instance
    }
    var trafficDataProvider: MoyaProvider<TrafficDataTarget> = MoyaProvider<TrafficDataTarget>()
}
