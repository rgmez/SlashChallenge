//
//  SlashChallengeUITests.swift
//  SlashChallengeUITests
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import XCTest

let app = XCUIApplication()

class SlashChallengeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOneUserEmpty() {
        
        waitForElementToAppear(app.textFields["firstUserTextfield"])
        app.textFields["firstUserTextfield"].tap()
        app.textFields["firstUserTextfield"].typeText("Player 1")
        app.textFields["firstUserTextfield"].typeText("\n")
        
        app.buttons["initGameButton"].tap()
        
        XCTAssert(waitForElementToAppear(app.alerts["Alert"]))
    }
    
    func testNotUsersEmpty() {
        
        waitForElementToAppear(app.textFields["initGameButton"])
        
        app.buttons["initGameButton"].tap()
        
        XCTAssert(waitForElementToAppear(app.alerts["Alert"]))
    }
    
    func testRegisterUsersSuccess() {
        
        waitForElementToAppear(app.textFields["firstUserTextfield"])
        waitForElementToAppear(app.textFields["secondUserTextfield"])
        
        app.textFields["firstUserTextfield"].tap()
        app.textFields["firstUserTextfield"].typeText("Player 1")
        app.textFields["firstUserTextfield"].typeText("\n")
        
        app.textFields["secondUserTextfield"].tap()
        app.textFields["secondUserTextfield"].typeText("Player 2")
        app.textFields["secondUserTextfield"].typeText("\n")
        
        app.buttons["initGameButton"].tap()
        
        XCTAssert(waitForElementToAppear(app.otherElements["GameViewController"]))
    }
    
    @discardableResult func waitForElementToAppear(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let expect = expectation(for: predicate, evaluatedWith: element,
                                 handler: nil)
        
        let result = XCTWaiter().wait(for: [expect], timeout: 5)
        
        return result == .completed
    }
}
