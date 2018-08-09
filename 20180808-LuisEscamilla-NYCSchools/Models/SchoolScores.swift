//
//  SchoolScores.swift
//  20180808-LuisEscamilla-NYCSchools
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import Foundation

class SchoolScores {
    
    var dbn :String!
    var name :String!
    
    /*These values could be numbers but I will treat them as Strings since I dont need to do any operation*/
    var reading :String!
    var math: String!
    var writing: String!
    
    init?(dictionary :JSONDictionary) {
        
        guard let dbn = dictionary["dbn"] as? String,
            let name = dictionary["school_name"] as? String,
            let reading = dictionary["sat_critical_reading_avg_score"] as? String,
            let math = dictionary["sat_math_avg_score"] as? String,
            let writing = dictionary["sat_writing_avg_score"] as? String else {
                return nil
        }
        
        self.dbn = dbn
        self.name = name
        self.reading = reading
        self.math = math
        self.writing = writing
        
    }
    
}
