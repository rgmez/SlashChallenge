//
//  GameViewController.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import UIKit

final class GameViewController: BaseViewController {

    // MARK: - Public properties -
    @IBOutlet weak var firstPlayerLabel: TitleLabel!
    @IBOutlet weak var firstPlayerScoreLabel: SecondaryLabel!
    @IBOutlet weak var secondPlayerLabel: TitleLabel!
    @IBOutlet weak var secondPlayerScoreLabel: SecondaryLabel!
    @IBOutlet weak var actualPlayerLabel: TitleLabel!
    @IBOutlet weak var questionLabel: BigLabel!
    @IBOutlet weak var answerStackView: UIStackView!
    @IBOutlet weak var firstPlayerView: UIView!
    @IBOutlet weak var secondPlayerView: UIView!
    
    var presenter: GamePresenterInterface!
    private let blurViewController = BlurViewController()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        setStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        view.accessibilityIdentifier = "GameViewController"
    }
    
    override func setText() {
        
    }
    
    func setStyle() {
        firstPlayerView.backgroundColor = UIColor.darkBlue
        secondPlayerView.backgroundColor = UIColor.lightBlue
        firstPlayerLabel.textColor = UIColor.white
        secondPlayerLabel.textColor = UIColor.white
        firstPlayerScoreLabel.textColor = UIColor.white
        secondPlayerScoreLabel.textColor = UIColor.white
    }
}

// MARK: - Extensions -

extension GameViewController: GameViewInterface {
    
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
    
    func setQuestion(title: String) {
        questionLabel.text = title.removingPercentEncoding
    }
    
    func setActualTurn(text: NSAttributedString) {
        actualPlayerLabel.attributedText = text
    }
    
    func setLoadingVisible(_ visible: Bool) {
        if visible {
            blurViewController.start()
        } else {
            blurViewController.stop()
        }
    }
    
    func configure(answers: [String]?) {
        guard let response = answers else { return }
        
        answerStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (index, resp) in response.enumerated() {
            let respButton = AnimatedButton(type: .custom)
            respButton.tag = index
            respButton.translatesAutoresizingMaskIntoConstraints = false
            respButton.setTitle(resp.removingPercentEncoding, for: .normal)
            respButton.setTitleColor(UIColor.white, for: .normal)
            respButton.backgroundColor = UIColor.lightBlue
            respButton.addTarget(self, action: #selector(evaluateAnswer(_:)), for: .touchUpInside)
            answerStackView.addArrangedSubview(respButton)
        }
    }
    
    @objc func evaluateAnswer(_ sender: Any) {
        guard let btn = sender as? UIButton else { return }

        presenter.evaluate(answer: btn.titleLabel?.text ?? "")
    }
}
