//
//  SlashChallengeTests.swift
//  SlashChallengeTests
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import XCTest
@testable import SlashChallenge

class SlashChallengeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameServiceSuccess() {
        
        let gameService = GameService()
        let gameExpectation = expectation(description: "movies")
        var gameData: [QuestionModel]?
        
        let params = ["amount": "10", "type": "multiple"]
        gameService.getGameData(params: params) { (result: Result<[QuestionModel]?, Error>) in
            switch result {
            case .success(let value):
                gameData = value
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            gameExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(gameData)
        }
    }
    
    func testResultService() {
        
        let result = ResultModel()
        let id = ResultService.incrementID()
        result.id = id
        result.firstUser = "First Player"
        result.firstScore = 1
        result.secondUser = "Second Player"
        result.secondScore = 2
        result.date = Date()
        
        ResultService.saveObject(object: result)
        
        XCTAssertNotNil(ResultService.getGame(with: id))
        XCTAssertNotNil(ResultService.getResults())
        
        ResultService.delete(with: id)
        
        XCTAssertNil(ResultService.getGame(with: id))
    }
}
