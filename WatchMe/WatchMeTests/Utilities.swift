//
//  Utilities.swift
//  WatchMeTests
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation

class Utilities: NSObject {
    public static func readJSONFile(identifier: String, file : String) -> AnyObject? {

        var result : AnyObject?

        if let bundle = Bundle(identifier: identifier) {
            guard let url = bundle.url(forResource: file, withExtension: "json") else {
                return result
            }

            do {
                let jsonData = try NSData(contentsOf: url, options: NSData.ReadingOptions.mappedIfSafe)
                //            let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    if let resultArr = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? Array<AnyObject>{
                        result = resultArr as AnyObject
                    } else if let resultDict = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String, AnyObject>{
                        result = resultDict as AnyObject
                    }

                } catch _ {
                    print("Error - Not able to serialize JSON response")
                }
            } catch _ {
                print("Error - Not able to read contents of file")
            }
        }

        return result
    }
}
