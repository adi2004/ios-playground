//
//  DarkModeAppUITests.swift
//  DarkModeAppUITests
//
//  Created by adrian.florescu on 22.09.2022.
//

import XCTest

class DarkModeAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Dark Mode with View Model"]/*[[".cells.staticTexts[\"Dark Mode with View Model\"]",".staticTexts[\"Dark Mode with View Model\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let darkStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Dark"]/*[[".cells.staticTexts[\"Dark\"]",".staticTexts[\"Dark\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        darkStaticText.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Unspecified"]/*[[".cells.staticTexts[\"Unspecified\"]",".staticTexts[\"Unspecified\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        darkStaticText.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Light"]/*[[".cells.staticTexts[\"Light\"]",".staticTexts[\"Light\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
