//
//  WelcomeViewController.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import UIKit
import IQKeyboardManagerSwift

final class WelcomeViewController: BaseViewController {

    // MARK: - Public properties -
    @IBOutlet weak var firstUserTextfield: UITextField!
    @IBOutlet weak var secondUserTextfield: UITextField!
    @IBOutlet weak var initGameButton: UIButton!
    @IBOutlet weak var showResultsButton: UIButton!
    
    var presenter: WelcomePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstUserTextfield.accessibilityIdentifier = "firstUserTextfield"
        secondUserTextfield.accessibilityIdentifier = "secondUserTextfield"
        initGameButton.accessibilityIdentifier = "initGameButton"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        presenter.viewDidDisappear(animated: animated)
    }
    
    override func setText() {
        firstUserTextfield.placeholder = "Welcome.FirstUser.title".localized
        secondUserTextfield.placeholder = "Welcome.SecondUser.title".localized
        initGameButton.setTitle("Welcome.StartGame.title".localized, for: .normal)
        showResultsButton.setTitle("Welcome.ShowResults.title".localized, for: .normal)
    }
	
    @IBAction func initGameAction(_ sender: Any) {
        presenter.didSelectInitGame(with: firstUserTextfield.text, secondUser: secondUserTextfield.text)
    }
    
    @IBAction func showResultsAction(_ sender: Any) {
        presenter.didSelectShowResults()
    }
}

// MARK: - Extensions -

extension WelcomeViewController: WelcomeViewInterface {
    
    func resetFields() {
        firstUserTextfield.text = nil
        secondUserTextfield.text = nil
    }
}

extension WelcomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if IQKeyboardManager.shared.goNext() == false { textField.resignFirstResponder() }
        return false
    }
}
