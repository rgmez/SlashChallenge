//
//  UIViewController+Extensions.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import UIKit

@nonobjc extension UIViewController {
    
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        
        if let frame = frame {
            child.view.frame = frame
        }
        
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func add(_ child: UIViewController, container: UIView? = nil) {
        
        guard let containerView = container else { return }
        
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.addChild(child)
            if let frame = container?.frame {
                child.view.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
            }
            
            child.view.alpha = 1
            
            container?.addSubview(child.view)
            child.didMove(toParent: self)
            
            self?.add(child.view, in: containerView)
        })
    }
    
    func add(_ child: UIViewController, container: UIView, frame: CGRect) {
        
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.addChild(child)
            child.view.frame = frame
            
            child.view.alpha = 1
            
            container.addSubview(child.view)
            child.didMove(toParent: self)
        })
    }
    
    func remove() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: { [weak self] in
            self?.view.alpha = 0
            }, completion: { [weak self] _ in
                self?.willMove(toParent: nil)
                self?.view.removeFromSuperview()
                self?.removeFromParent()
        })
    }
    
    func add(_ contentView: UIView, in containerView: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addConstraints([
            NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: containerView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1.0, constant: 0.0)
            ])
    }
}

extension UIViewController {
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
