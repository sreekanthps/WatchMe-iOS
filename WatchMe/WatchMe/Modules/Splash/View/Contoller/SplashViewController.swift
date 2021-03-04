//
//  SplashViewController.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - View Mapping
    private var mainView: SplashView {
        return self.view as! SplashView
    }
    
    init(){
        super.init(nibName: nil, bundle: Bundle.main)
       }

    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    override func viewDidLoad() {
      super.viewDidLoad()
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    override func loadView() {
        let view = SplashView()
        view.delegate = self
        self.view = view
    }
    
    func startAnimation() {
        mainView.startLoadAnimation()
    }
    
    func navigateToDashBoard() {
        Timer.scheduledTimer(withTimeInterval: Constants.General.delayTimer, repeats: false) { (nil) in
            let newVC = HomeRouter.createModule()
            self.navigationController?.pushViewController(newVC, animated: false)
        }
    }
}
// MARK: - ActionDelegate
extension SplashViewController: ActionDelegate {
    func actionSender(didReceiveAction action: DelegateAction) {
        switch action {
        case SplashView.Action.AnimationComplete :
            self.navigateToDashBoard()
         default: break
        }
    }
}

