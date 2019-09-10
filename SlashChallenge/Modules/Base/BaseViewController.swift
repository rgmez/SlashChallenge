//
//  BaseViewController.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setText()
    }
    
    func setText() {
        fatalError("Must Override")
    }
}
