//
//  BlurViewController.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//

import UIKit

final class BlurViewController: UIViewController {
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var color: UIColor?
    
    init(color: UIColor? = nil) {
        self.color = color
        super.init(nibName: String(describing: BlurViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = self.color {
            activityIndicator.color = color
        } else {
            activityIndicator.color = UIColor.darkBlue
        }
    }
    
    func isAnimating() -> Bool {
        if activityIndicator == nil { return false }
        
        return activityIndicator.isAnimating
    }
    
    func start() {
        
        if view.superview == nil {
            if let window = UIApplication.shared.keyWindow {
                view.frame = window.frame
                UIApplication.shared.keyWindow!.addSubview(view)
            }
        } else if activityIndicator.isAnimating { return }
        
        UIView.transition(with: view, duration: 0.4, options: .transitionCrossDissolve, animations: { [weak self] in ()
            
            self?.activityIndicator.alpha = 1.0
            self?.activityIndicator.startAnimating()
            self?.view.alpha = 1.0
            
        }, completion: nil)
    }
    
    func stop() {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            
            if self.activityIndicator == nil { return }
            
            if self.activityIndicator.isAnimating {
                
                UIView.transition(with: self.view, duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.activityIndicator.alpha = 0.0
                    self.activityIndicator.stopAnimating()
                    self.view.alpha = 0.0
                    
                    }, completion: { (_) in
                        self.view.removeFromSuperview()
                })
            }
        }

    }
}
