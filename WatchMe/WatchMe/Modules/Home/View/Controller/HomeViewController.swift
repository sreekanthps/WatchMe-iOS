//
//  HomeViewController.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController {
    
    // MARK: -  Properties
    var presenter: HomeViewToPresenterProtocol?
    
    // MARK: - Computed Properties
    var mapView: GMSMapView  = {
        let camera = GMSCameraPosition.camera(withLatitude: 1.305123, longitude: 103.863003, zoom: 13.0)
        let screenBounds = UIScreen.main.bounds
        let rect = CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height)
        let mapView = GMSMapView.map(withFrame: rect, camera: camera)
        mapView.isTrafficEnabled = true
        return mapView
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.view.addSubview(mapView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.updateTrafficInfo()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func navigatetoDetailsPopup(data: Any?) {
        let detailsVC = DetailspopupViewController(details: data)
           detailsVC.modalPresentationStyle = .custom
           detailsVC.modalTransitionStyle = .crossDissolve
           self.present(detailsVC, animated: true)
           
       }
}
// MARK: - GMSMapViewDelegate
extension HomeViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        navigatetoDetailsPopup(data: marker.userData)
      return true
    }
    
}
// MARK: - HomePresenterToViewProtocol
extension HomeViewController: HomePresenterToViewProtocol {
    func showTrafficData() {
        guard let trafficInfo = presenter?.trafficData,
              let items = trafficInfo.items,
              let cameras = items.first?.cameras else { return }
                      cameras.forEach{
                          let marker = GMSMarker()
                          guard let lat = $0.location?.latitude , let long = $0.location?.longitude else { return }
                          marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
                          marker.map = self.mapView
                          marker.userData = $0
                      }
    }
  
    func showError() {
        let message = presenter?.errorData?.localizedDescription
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
