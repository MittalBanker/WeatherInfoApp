//
//  WeatherInfoAppUITests.swift
//  WeatherInfoAppUITests
//
//  Created by Mittal Banker on 30/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import XCTest

class WeatherInfoAppUITests: XCTestCase {
        
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
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAddLocationtoOnsMap() {

        let app = XCUIApplication()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element.tap()
        app/*@START_MENU_TOKEN@*/.otherElements["Hyderabad"]/*[[".maps.otherElements[\"Hyderabad\"]",".otherElements[\"Hyderabad\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let emptyListTable = app.tables["Empty list"]
        emptyListTable/*@START_MENU_TOKEN@*/.press(forDuration: 0.0);/*[[".tap()",".press(forDuration: 0.0);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        emptyListTable.tap()
        emptyListTable.tap()
        emptyListTable.tap()
        app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Islamabad").element/*[[".maps.containing(.other, identifier:\"Sri Lanka\").element",".maps.containing(.other, identifier:\"Bengaluru\").element",".maps.containing(.other, identifier:\"Bay of Bengal\").element",".maps.containing(.other, identifier:\"Hyderabad\").element",".maps.containing(.other, identifier:\"Mumbai\").element",".maps.containing(.other, identifier:\"Chittagong\").element",".maps.containing(.other, identifier:\"Kolkata\").element",".maps.containing(.other, identifier:\"India\").element",".maps.containing(.other, identifier:\"Bangladesh\").element",".maps.containing(.other, identifier:\"Bogra\").element",".maps.containing(.other, identifier:\"Bhutan\").element",".maps.containing(.other, identifier:\"Nepal\").element",".maps.containing(.other, identifier:\"New Delhi\").element",".maps.containing(.other, identifier:\"Lahore\").element",".maps.containing(.other, identifier:\"Islamabad\").element"],[[[-1,14],[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()


    }
    
}
