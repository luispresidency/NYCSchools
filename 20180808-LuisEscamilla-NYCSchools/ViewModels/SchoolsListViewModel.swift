//
//  SchoolsListViewModel.swift
//  20180808-LuisEscamilla-NYCSchools
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import Foundation

class SchoolsListViewModel {
    
    let title = "NYC Schools"
    private var schoolViewModels :[SchoolViewModel] = [SchoolViewModel]() {
        didSet {
            self.bindToSchoolViewModels()
        }
    }
    
    var bindToSchoolViewModels :(() -> ()) = {  }
    
    func createSchoolsList(schools: [School]) {
        schoolViewModels = schools.compactMap(SchoolViewModel.init)
    }
    
    func totalSchools() -> Int {
        return schoolViewModels.count
    }
    
    func school(at index:Int) -> SchoolViewModel {
        return self.schoolViewModels[index]
    }
}

class SchoolViewModel {
    
    var dbn :String
    var name :String
    var email :String
    var city :String
    var website :String
    var description :String {
        get {
            return "\(name)\n\n\(email) \u{2709}\n\(city) \u{1F4CD}"
        }
    }
    var websiteURL :URL? {
        get {
            // if website doesnt contains http://, add it
            if !(website as NSString).contains("http://"){
                if let url = URL(string: "http://\(website)") {
                    return url
                }
                return nil
            }
            if let url = URL(string: website) {
                return url
            }
            return nil
        }
    }
    
    init(school :School) {
        self.dbn = school.dbn
        self.name = school.name
        self.email = school.email
        self.city = school.city
        self.website = school.website
    }
}
