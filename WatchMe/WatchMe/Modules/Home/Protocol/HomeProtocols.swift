//
//  HomeProtocols.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation
import UIKit

protocol HomePresenterToViewProtocol: class {
    func showTrafficData()
    func showError()
}

protocol HomeInteractorToPresenterProtocol: class {
    func trafficInfoSuccess()
    func trafficInfoFailure()
}

protocol HomePresentorToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    var trafficData: TrafficInfo? { get }
    var trafficError: Error? { get }
    func fetchMapsData()
}

protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresentorToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    
    func updateTrafficInfo()
    var trafficData: TrafficInfo? { get }
    var errorData: Error? { get }
}

protocol HomePresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
