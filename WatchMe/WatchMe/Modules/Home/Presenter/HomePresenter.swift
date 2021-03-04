//
//  HomePresenter.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {
    // MARK: - Computed Properties
    var errorData: Error? {
        return interactor?.trafficError
    }
    
    var trafficData: TrafficInfo? {
        return interactor?.trafficData
    }
    
    // MARK: - Properties
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresentorToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateTrafficInfo() {
        interactor?.fetchMapsData()
    }
    
    
}
// MARK: - HomeInteractorToPresenterProtocol
extension HomePresenter: HomeInteractorToPresenterProtocol  {
    func trafficInfoSuccess() {
        view?.showTrafficData()
    }
    func trafficInfoFailure() {
        view?.showError()
    }
}
