//
//  CameraInfoFactory.swift
//  WatchMeTests
//
//  Created by Sreekanth on 26/2/21.
//


import XCTest
@testable import WatchMe

public struct CameraInfoFactory {

    public static func getCamerainfo_oneData(date: Date) -> TrafficInfo {
        return TrafficInfo(items: [Item(timestamp: "2021-02-26T02:42:51+08:00",
                                       cameras: [Camera(timestamp: "2021-02-26T02:42:51+08:00",
                                                        image: "https://images.data.gov.sg/api/traffic-images/2021/02/87bf7851-4a38-4de4-9e5d-44e652593cd8.jpg",
                                                        location: Location(latitude: 1.29409891409364, longitude: 103.876056196568),
                                                        cameraId: "1504",
                                                        imageMetadata: nil)])],
                          apiInfo: nil)
    }

    public static func get_single_camera(date: Date) -> Camera {
        return Camera(timestamp: "2021-02-27T02:42:51+08:00",
                       image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/04/01/16/autobahn.jpg?width=990&auto=webp&quality=75",
                       location: Location(latitude: 1.357098686, longitude: 103.902042),
                       cameraId: "1001",
                       imageMetadata: nil)

    }

   
}
