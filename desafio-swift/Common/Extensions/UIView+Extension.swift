//
//  UIView+Extension.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

let kLoadingViewTag: Int = 13131
extension UIView {
    var isDisplayingLoadingIndicator: Bool {
        return viewWithTag(kLoadingViewTag) != nil
    }
    @objc func displayLoadingIndicator(
        text: String? = nil,
        backgroundColor: UIColor = .white) {
        guard !isDisplayingLoadingIndicator else { return }
        let loadingOverlay = LoadingViewOverlay(text: text)
        loadingOverlay.tag = kLoadingViewTag
        loadingOverlay.backgroundColor = backgroundColor
        loadingOverlay.layer.masksToBounds = true
        addContainerView(loadingOverlay, onTop: true)
    }
    @objc func dismissLoadingIndicator() {
        viewWithTag(kLoadingViewTag)?.removeFromSuperview()
    }
    
    func addContainerView(_ containerView: UIView, onTop: Bool = false) {
        addSubview(containerView)
        
        if onTop {
            bringSubviewToFront(containerView)
        }
        
        tightConstrain(containerView)
    }
    
    func tightConstrain(_ containerView: UIView) {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func addWindowView(_ containerView: UIView, onTop: Bool = false) {
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(containerView)
            tightWindowConstrain(containerView, window)
            return
        } else {
            addSubview(containerView)
        }
        if onTop {
            bringSubviewToFront(containerView)
        }
        tightConstrain(containerView)
    }
    
    func tightWindowConstrain(_ containerView: UIView, _ window: UIWindow) {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
    }
}
