//
//  ASActivityIndicator.swift
//  https://github.com/Akki9326/ASActivityIndicator
//
//  Created by Akash Soni on 21/10/16.
//  Copyright © 2019 AS. All rights reserved.
//

import UIKit

class ASActivityIndicator: NSObject {

    
    fileprivate static let overlayView: UIView = UIView()
    fileprivate static let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView (style: UIActivityIndicatorView.Style.whiteLarge)
    
    class var shared : ASActivityIndicator{
        struct Static {
            static let instance = ASActivityIndicator()
        }
        return Static.instance
    }
    
    fileprivate override init() {
        super.init()
        ASActivityIndicator.activityIndicator.color = UIColor.gray
        ASActivityIndicator.overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    func showLoadingIndicator() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        guard let window : UIWindow = (UIApplication.shared.keyWindow) else { return }
        ASActivityIndicator.overlayView.frame = window.frame
        ASActivityIndicator.activityIndicator.center = window.center
        ASActivityIndicator.activityIndicator.startAnimating()
        ASActivityIndicator.overlayView.addSubview(ASActivityIndicator.activityIndicator)
        window.addSubview(ASActivityIndicator.overlayView)
        window.bringSubviewToFront(ASActivityIndicator.overlayView)
    }
    
    func hideLoadingIndicator() {
        UIApplication.shared.endIgnoringInteractionEvents()
        ASActivityIndicator.activityIndicator.stopAnimating()
        ASActivityIndicator.overlayView.removeFromSuperview()
    }
}
