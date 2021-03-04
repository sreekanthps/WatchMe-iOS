//
//  HomeRouter.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import Foundation
import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor:HomePresentorToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    
}
