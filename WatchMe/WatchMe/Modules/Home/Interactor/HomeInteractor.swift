//
//  HomeInteractor.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation

class HomeInteractor: HomePresentorToInteractorProtocol {
    
    // MARK: - Properties
    var trafficError: Error?
    weak var presenter: HomeInteractorToPresenterProtocol?
    var trafficData: TrafficInfo?
    
    // MARK: - Methods
    func fetchMapsData() {
        let service = TrafficService(provider: ConcreteProviderFactory.shared.trafficDataProvider,delegate: self)
        let timeStamp =  Date()
        let dataString = Constants.dateFormatter.string(from: timeStamp)
        service.getTrafficData(for: dataString)
    }
     
}
// MARK: - TrafficeResponseProtocol
extension HomeInteractor: TrafficeResponseProtocol {
    func returnTrafficData(data: TrafficInfo?) {
        self.trafficData = data
        self.presenter?.trafficInfoSuccess()
    }
    func returnErrorReponse(error: Error) {
        self.trafficError = error
        self.presenter?.trafficInfoFailure()
    }
    
}
