//
//  SchoolScoresViewModel.swift
//  20180808-LuisEscamilla-NYCSchoolsTests
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import XCTest
@testable import _0180808_LuisEscamilla_NYCSchools

class SchoolScoresViewModelTests: XCTestCase {
    
    var schoolScores: SchoolScores? = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        schoolScores = SchoolScores(dictionary: ["dbn":"1234","school_name":"Name","sat_critical_reading_avg_score":"100","sat_math_avg_score":"99","sat_writing_avg_score":"98"])
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSchoolScoreViewModel_success() {
        let schoolScoresViewModel = SchoolScoresViewModel()
        schoolScoresViewModel.createViewModel(schoolScores: schoolScores!)
        
        XCTAssertTrue(schoolScoresViewModel.name == "Name")
        XCTAssertTrue(schoolScoresViewModel.reading == "100")
        XCTAssertTrue(schoolScoresViewModel.math == "99")
        XCTAssertTrue(schoolScoresViewModel.writing == "98")
        
    }
    
    func testSchoolScoreViewModelScores_success() {
        let schoolScoresViewModel = SchoolScoresViewModel()
        schoolScoresViewModel.createViewModel(schoolScores: schoolScores!)
        
        XCTAssertTrue((schoolScoresViewModel.schoolScores as NSString).contains("Name"))
        XCTAssertTrue((schoolScoresViewModel.schoolScores as NSString).contains("Reading: 100"))
        XCTAssertTrue((schoolScoresViewModel.schoolScores as NSString).contains("Math: 99"))
        XCTAssertTrue((schoolScoresViewModel.schoolScores as NSString).contains("Writing: 98"))
        
    }
    
}
