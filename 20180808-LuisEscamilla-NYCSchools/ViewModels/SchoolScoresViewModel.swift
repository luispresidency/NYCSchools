//
//  SchoolScoresViewModel.swift
//  20180808-LuisEscamilla-NYCSchools
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import Foundation

class SchoolScoresViewModel {
    
    let title = "School Details"
    var name :String = ""
    var reading :String = ""
    var math: String = ""
    var writing: String = ""
    
    var bindToSchoolViewModels :(() -> ()) = {  }
    
    func createViewModel(schoolScores: SchoolScores) {
        defer {
            bindToSchoolViewModels()
        }
        
        self.name = schoolScores.name
        self.reading = schoolScores.reading
        self.math = schoolScores.math
        self.writing = schoolScores.writing
    
    }
    
    var schoolScores : String {
        get {
            return "\(name)\n\nMath: \(math)\nReading: \(reading)\nWriting: \(writing)"
        }
    }
    
}
