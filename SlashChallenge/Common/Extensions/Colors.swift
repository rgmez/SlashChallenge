//
//  Colors.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import UIKit
extension UIColor {
    
    class var darkBlue: UIColor {
        return self.hexColor(0x275070, alpha: 1.0)
    }

    class var lightBlue: UIColor {
        return self.hexColor(0x82bbcf, alpha: 1.0)
    }
    
    class func hexColor(_ hexColorNumber:UInt32, alpha: CGFloat) -> UIColor {
        let red = (hexColorNumber & 0xff0000) >> 16
        let green = (hexColorNumber & 0x00ff00) >> 8
        let blue =  (hexColorNumber & 0x0000ff)
        return self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
}
