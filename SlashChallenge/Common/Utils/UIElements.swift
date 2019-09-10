//
//  UIElements.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//

import UIKit


//MARK: - Buttons
class AnimatedButton: UIButton {
    
    var isAnimating = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addTarget(self, action: #selector(pressedAnimation), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if !isAnimating {
            UIView.animate(withDuration: 0.15) {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.alpha = 0.5
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if !isAnimating {
            UIView.animate(withDuration: 0.15) {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.alpha = 1.0
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        if !isAnimating {
            UIView.animate(withDuration: 0.15) {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.alpha = 1.0
            }
        }
    }
    
    @objc func pressedAnimation() {
        
        isAnimating = true
        
        UIView.animate(withDuration: 0.30, animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.alpha = 0.5
        }) { (_) in
            UIView.animate(withDuration: 0.30) {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.alpha = 1.0
                self.isAnimating = false
            }
        }
    }
}

class BaseButton: AnimatedButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setCommonStyle()
    }
    
    func setCommonStyle () {
        self.backgroundColor = UIColor.darkBlue
        self.layer.cornerRadius = 8.0
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
        self.setTitleColor(UIColor.white, for: .normal)
        self.contentEdgeInsets = UIEdgeInsets.init(top: 7, left: 21, bottom: 7, right: 21)
    }
}

class SecondaryButton: AnimatedButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCommonStyle()
    }
    
    func setCommonStyle () {
        self.backgroundColor = UIColor.lightBlue
        self.layer.cornerRadius = 8.0
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
        self.setTitleColor(UIColor.white, for: .normal)
        self.contentEdgeInsets = UIEdgeInsets.init(top: 7, left: 21, bottom: 7, right: 21)
    }
}

//MARK: - Label
class NormalLabel: UILabel {
    override func awakeFromNib() {
        self.font = UIFont.systemFont(ofSize: 15)
        self.textColor = UIColor.lightBlue
    }
}

class SecondaryLabel: UILabel {
    override func awakeFromNib() {
        self.font = UIFont.systemFont(ofSize: 14)
        self.textColor = UIColor.lightBlue
    }
}

class TitleLabel: UILabel {
    override func awakeFromNib() {
        self.font = UIFont.boldSystemFont(ofSize: 17)
        self.textColor = UIColor.black
    }
}

class BigLabel: UILabel {
    override func awakeFromNib() {
        self.font = UIFont.boldSystemFont(ofSize: 24)
        self.textColor = UIColor.black
    }
}

class HighLabel: UILabel {
    override func awakeFromNib() {
        self.font = UIFont.boldSystemFont(ofSize: 40)
        self.textColor = UIColor.black
    }
}

