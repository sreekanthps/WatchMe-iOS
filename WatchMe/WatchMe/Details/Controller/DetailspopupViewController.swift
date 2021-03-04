//
//  DetailspopupViewController.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import UIKit

class DetailspopupViewController: UIViewController {
    // MARK: - Properties
    var cameraDetails: Camera?
    var mainView: DetailspopupView {
        return self.view as! DetailspopupView
    }
    // MARK: - Methods
    init(){
        super.init(nibName: nil, bundle: Bundle.main)
       }
    convenience init(details: Any?) {
        self.init()
        cameraDetails =  details as? Camera
    }
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.60)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    override func loadView() {
        let view = DetailspopupView(label: cameraDetails?.cameraInfo , image: cameraDetails?.image)
        view.delegate = self
        self.view = view
    }
    
}
// MARK: - ActionDelegate
extension DetailspopupViewController: ActionDelegate {
    func actionSender(didReceiveAction action: DelegateAction) {
        switch action {
            case DetailspopupView.Action.CloseButtonPress :
                self.dismiss(animated: true, completion: nil)
            default : break
        }
    }
    
}

