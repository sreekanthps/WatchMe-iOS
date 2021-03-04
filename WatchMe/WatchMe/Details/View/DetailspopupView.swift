//
//  DetailspopupView.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import UIKit
import FlexLayout
import PinLayout


class DetailspopupView: UIView {
    // MARK: - DelegateAction
    enum Action: DelegateAction {
       case CloseButtonPress
    }
    // MARK: - Properties
    
    weak var delegate: ActionDelegate?
    var title: String?
    var imagePath: String?
    
    // MARK: - Computer Properties
     let dataView : UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 6.0
        uiView.layer.borderWidth = 1.2
        uiView.layer.shouldRasterize = true
        uiView.layer.shadowColor = UIColor.black.cgColor
        uiView.layer.shadowOpacity = 1
        uiView.layer.shadowOffset = .zero
        uiView.layer.shadowRadius = 6.0
        return uiView
    }()
    
    let image : UIImageView = {
        let image = UIImageView(frame: .zero)
        return image
    }()
    
    let headerView : UIView = {
            let uiView = UIView()
            uiView.backgroundColor = UIColor.hexColor(Colors.hd1)
            return uiView
        }()
    let closebutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close-icon"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)),for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        return button
    }()
    
   let root : UIView = {
            let view = UIView()
            view.backgroundColor = .clear
            let gesture = UITapGestureRecognizer(target: self,action: #selector(dismissAction(_:)))
            view.addGestureRecognizer(gesture)
            return view
        }()
    private let fileName: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            label.textColor = UIColor.hexColor(Colors.bc3)
            label.numberOfLines = 2
            label.textAlignment = .center
            return label
        }()
    
    init(label: String?, image: String?) {
            super.init(frame: .zero)
            self.title = label
            self.imagePath = image
            configure()
            loadView()
         }
    func configure() {
        fileName.text = title ?? ""
        image.setImage(from: self.imagePath)
   }
    
    @objc func dismissAction(_ sender:UITapGestureRecognizer){
        delegate?.actionSender(didReceiveAction: Action.CloseButtonPress)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        delegate?.actionSender(didReceiveAction: Action.CloseButtonPress)
    }
    
    func loadView() {
            root.flex.justifyContent(.center).define { (flex) in
                flex.addItem(dataView).marginHorizontal(10).define { (flex) in
                    flex.addItem(headerView).direction(.row).height(50).define { (flex) in
                        flex.addItem(closebutton).size(50).marginLeft(0).marginRight(0)
                        flex.addItem(fileName).marginLeft(20).marginRight(0)
                    }
                    flex.addItem(image).width(100%).height(250).alignSelf(.center)
                }
            }
            addSubview(root)
        }
    
    required init?(coder aDecoder: NSCoder) {
            nil
        }
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        root.pin.all(pin.safeArea)
        
        // Then let the flexbox container layout itself
        root.flex.layout()
    }
}
