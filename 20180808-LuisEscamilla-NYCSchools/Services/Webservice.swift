//
//  Webservice.swift
//  20180808-LuisEscamilla-NYCSchools
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

class Webservice {
    
    func loadSchools(url: String, completion :@escaping ([School]?, Error?) -> ()){
        
        let url = URL(string: url)!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionaries = json as! [JSONDictionary]
                
                let schools = dictionaries.compactMap(School.init)
                
                DispatchQueue.main.async {
                    completion(schools, error)
                }
                
            }else{
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func loadScores(url: String, completion :@escaping ([String:SchoolScores]?, Error?) -> ()){
        
        let url = URL(string: url)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionaries = json as! [JSONDictionary]
                
                //let schoolScores = dictionaries.compactMap(SchoolScores.init)
                var schoolScoresDict = [String:SchoolScores]()
                for json in dictionaries {
                    if let schoolScores = SchoolScores.init(dictionary: json){
                        schoolScoresDict[schoolScores.dbn] = schoolScores
                    }
                }
                
                DispatchQueue.main.async {
                    completion(schoolScoresDict, error)
                }
                
            }else{
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}
