//
//  School.swift
//  20180808-LuisEscamilla-NYCSchools
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import Foundation

class School {
    
    var dbn :String!
    var name :String!
    var email :String!
    var city :String!
    var website :String!
    
    init?(dictionary :JSONDictionary) {

        guard let dbn = dictionary["dbn"] as? String,
            let name = dictionary["school_name"] as? String,
            let email = dictionary["school_email"] as? String,
            let city = dictionary["city"] as? String,
            let website = dictionary["website"] as? String else {
                return nil
        }
        
        self.dbn = dbn
        self.name = name
        self.email = email
        self.city = city
        self.website = website
    }
    
}
