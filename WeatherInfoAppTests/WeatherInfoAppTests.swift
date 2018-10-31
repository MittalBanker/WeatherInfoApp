//
//  WeatherInfoAppTests.swift
//  WeatherInfoAppTests
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import XCTest
@testable import WeatherInfoApp

class WeatherInfoAppTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testParseDemoJSON() {

        // Data setup
        let jsonString = "{ \"dt\": 1406106000, \"main\": { \"temp\": 298.77, \"temp_min\": 298.77, \"temp_max\": 298.774, \"pressure\": 1005.93, \"sea_level\": 1018.18, \"grnd_level\": 1005.93, \"humidity\": 87, \"temp_kf\": 0.26 }, \"weather\": [ { \"id\": 804, \"main\": \"Clouds\",\"description\": \"overcast clouds\", \"icon\": \"04d\" } ], \"clouds\": { \"all\": 88 }, \"wind\": {\"speed\": 5.71, \"deg\": 229.501 }, \"sys\": { \"pod\": \"d\" }, \"dt_txt\": \"2014-07-23 09:00:00\"}"

        let data = jsonString.data(using: .utf8)
        let json: JSONPayload? = try! JSONSerialization.jsonObject(with: data!) as? JSONPayload
        let weatherDataPoints = WeatherApi.shared.parse(json!)
       // Does it seem to be correctly parsed?
        XCTAssertTrue(weatherDataPoints?.temperature == 298.77)
        XCTAssertTrue(weatherDataPoints?.wind == 5.71)
        XCTAssertTrue(weatherDataPoints?.humidity == 87)
        XCTAssertTrue(weatherDataPoints?.description == "overcast clouds")
    }

    func actualServerApiCallCheckWithoutStub() {
        
    }
}

