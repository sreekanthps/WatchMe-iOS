//
//  TrafficInfo.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation
// MARK: - TrafficInfo
public struct TrafficInfo: Codable, Equatable {
    var items: [Item]?
    var apiInfo: APIInfo?
}

// MARK: - APIInfo
public struct APIInfo: Codable, Equatable {
    var status: String?
}

// MARK: - Item
public struct Item: Codable, Equatable {
    var timestamp: String?
    var cameras: [Camera]?
}

// MARK: - Camera
public struct Camera: Codable, Equatable {
    var timestamp: String?
    var image: String?
    var location: Location?
    var cameraId: String?
    var imageMetadata: ImageMetadata?
    
    var cameraInfo: String {
        guard let id = cameraId, let time = timestamp else { return "" }
        return id + " - " + time
    }
}

// MARK: - ImageMetadata
public struct ImageMetadata: Codable, Equatable {
    var height, width: Int?
    var md5: String?
}

// MARK: - Location
public struct Location: Codable, Equatable {
    var latitude, longitude: Double?
}
