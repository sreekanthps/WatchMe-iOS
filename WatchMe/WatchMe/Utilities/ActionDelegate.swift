//
//  ActionDelegate.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation
public protocol DelegateAction {}
public protocol ActionDelegate: class {
    func actionSender(didReceiveAction action: DelegateAction)
}
