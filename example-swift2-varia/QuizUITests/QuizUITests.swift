//
//  QuizUITests.swift
//  QuizUITests
//
//  Created by Adrian Florescu on 01.06.16.
//  Copyright © 2016 infloresc.ro. All rights reserved.
//

import XCTest

class QuizUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        XCUIApplication().terminate()
        super.tearDown()
    }
    
    func testSimpleRun() {
        let app = XCUIApplication()
        XCTAssertFalse(app.staticTexts["v1"].exists)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGoToQuizViewController() {
        let app = XCUIApplication()
        app.buttons["Start Test..."].tap()
        XCTAssert(app.staticTexts["v1"].exists)
        XCTAssert(app.staticTexts["v2"].exists)
        XCTAssert(app.staticTexts["title"].exists)
        XCTAssert(app.staticTexts["plus"].exists)
    }
    
    func testDismissKeyboard() {
        let app = XCUIApplication()
        app.buttons["Start Test..."].tap()
        sleep(2)
        XCTAssertTrue(app.keyboards[""].exists)
        app.staticTexts["title"].tap()
        XCTAssertFalse(app.keyboards[""].exists)
    }
    
    func testDismissKeyboard2() {
        let app = XCUIApplication()
        app.buttons["Start Test..."].tap()
        sleep(1)
        XCTAssertTrue(app.keyboards[""].exists)
        app.staticTexts["title"].tap()
        XCTAssertFalse(app.keyboards[""].exists)
    }
    
    func testDismissKeyboard3() {
        let app = XCUIApplication()
        app.buttons["Start Test..."].tap()
        sleep(5)
        XCTAssertTrue(app.keyboards[""].exists)
        app.staticTexts["title"].tap()
        XCTAssertFalse(app.keyboards[""].exists)
    }
}
