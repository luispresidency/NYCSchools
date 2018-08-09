//
//  _0180808_LuisEscamilla_NYCSchoolsTests.swift
//  20180808-LuisEscamilla-NYCSchoolsTests
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import XCTest
@testable import _0180808_LuisEscamilla_NYCSchools

class WebserviceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadSchools_success() {
        let expectation = self.expectation(description: "Load Schools")
        var loadedSchools: [School]? = nil
        var myError: Error? = nil
        
        Webservice().loadSchools(url: Constants.schoolsListURL){ (schools, error) in
            if let schools = schools {
                loadedSchools = schools
            }
            myError = error
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(loadedSchools != nil)
        XCTAssertTrue(myError == nil)
    }
    
    func testLoadSchools_fail() {
        let expectation = self.expectation(description: "Load Schools")
        var loadedSchools: [School]? = nil
        var myError: Error? = nil
        
        Webservice().loadSchools(url: "https://dfghgfdthytsredtft.com"){ (schools, error) in
            if let schools = schools {
                loadedSchools = schools
            }
            myError = error
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(loadedSchools == nil)
        XCTAssertTrue(myError != nil)
    }
    
    func testLoadSchoolScores_success() {
        let expectation = self.expectation(description: "Load School Scores")
        var loadedSchoolScores: [String:SchoolScores]? = nil
        var myError: Error? = nil
        
        Webservice().loadScores(url: Constants.schoolsScoresURL){ (schoolScores, error) in
            if let schoolScores = schoolScores {
                loadedSchoolScores = schoolScores
            }
            myError = error
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(loadedSchoolScores != nil)
        XCTAssertTrue(myError == nil)
    }
    
    func testLoadSchoolScores_fail() {
        let expectation = self.expectation(description: "Load School Scores")
        var loadedSchoolScores: [String:SchoolScores]? = nil
        var myError: Error? = nil
        
        Webservice().loadScores(url: "https://dfghgfdthytsredtft.com"){ (schoolScores, error) in
            if let schoolScores = schoolScores {
                loadedSchoolScores = schoolScores
            }
            myError = error
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(loadedSchoolScores == nil)
        XCTAssertTrue(myError != nil)
    }
}
