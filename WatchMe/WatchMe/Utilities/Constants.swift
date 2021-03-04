//
//  Constants.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation
// MARK: - Constants
enum Constants {
    enum General{
        static let delayTimer = 0.1
    }
  static let apiKey = "AIzaSyCCvrM8vq5yDzzppgFISEbF_qh1kFUOu4E"
  static let baseURL = "https://api.data.gov.sg/"
  static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"
        return dateFormatter
    }
 static let timeInterval: TimeInterval = 30
 static let splashImage = "splashmaps"

    enum Animation {
        static let animationrepeat: Float = 0
        static let animationFile = "warning-icon"
        static let animationFile1 = "glass"
    }
    struct Decimals {
        static let half: Double = 0.5
    }
    
}
