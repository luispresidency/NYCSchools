//
//  SchoolsViewModel.swift
//  20180808-LuisEscamilla-NYCSchoolsTests
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import XCTest
@testable import _0180808_LuisEscamilla_NYCSchools

class SchoolsViewModelTests: XCTestCase {
    
    var school: School? = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        school = School(dictionary: ["dbn":"1234","school_name":"Name","school_email":"school@school.com","city":"Brooklin","website":"www.school.com"])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSchoolViewModel_success() {
        let schoolViewModel = SchoolViewModel(school: school!)
        
        XCTAssertTrue(schoolViewModel.dbn == "1234")
        XCTAssertTrue(schoolViewModel.name == "Name")
        XCTAssertTrue(schoolViewModel.email == "school@school.com")
        XCTAssertTrue(schoolViewModel.city == "Brooklin")
        XCTAssertTrue(schoolViewModel.website == "www.school.com")
    }
    
    func testSchoolViewModelWebsiteURL_success() {
        let schoolViewModel = SchoolViewModel(school: school!)
        
        if let websiteURL = schoolViewModel.websiteURL?.absoluteString{
            XCTAssertTrue((websiteURL as NSString).contains("http://"))
        }else{
            XCTAssertTrue(false)
        }
    }
    
}
