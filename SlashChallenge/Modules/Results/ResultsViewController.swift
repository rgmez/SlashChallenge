//
//  ResultsViewController.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//


import UIKit

final class ResultsViewController: BaseViewController {

    // MARK: - Public properties -
    
    @IBOutlet weak var resultLabel: HighLabel!
    @IBOutlet weak var firstPlayerLabel: TitleLabel!
    @IBOutlet weak var firstPlayerScoreLabel: SecondaryLabel!
    @IBOutlet weak var secondPlayerLabel: TitleLabel!
    @IBOutlet weak var secondPlayerScoreLabel: SecondaryLabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var askToOtherActionLabel: BigLabel!
    @IBOutlet weak var anotherOpponentButton: UIButton!
    @IBOutlet weak var showResultsButton: UIButton!
    
    var presenter: ResultsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func setText() {
        anotherOpponentButton.setTitle("Results.Another.Oponent.title".localized, for: .normal)
        showResultsButton.setTitle("Results.ShowResults.title".localized, for: .normal)
        askToOtherActionLabel.text = "Results.Another.Action.message".localized
    }
    
    @IBAction func anotherOpponentAction(_ sender: Any) {
        presenter.didSelectAnotherOpponent()
    }
    
    @IBAction func showResultsAction(_ sender: Any) {
        presenter.didSelectShowResults()
    }
}

// MARK: - Extensions -

extension ResultsViewController: ResultsViewInterface {
    func setFirstPlayer(name: String) {
        firstPlayerLabel.text = name
    }
    
    func setSecondPlayer(name: String) {
        secondPlayerLabel.text = name
    }
    
    func setFirstPlayer(score: String) {
        firstPlayerScoreLabel.text = score
    }
    
    func setSecondPlayer(score: String) {
        secondPlayerScoreLabel.text = score
    }
    
    func setResult(text: String) {
        resultLabel.text = text
    }
    
    func setResult(image: String) {
        resultImageView.image = UIImage(named: image)
    }
    
}
