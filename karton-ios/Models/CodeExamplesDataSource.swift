//
//  CodeExamplesDataSource.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 27.10.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

class CodeExamplesDataSource {
    
    var exampleArray: [CodeExample] = [] 
    // en version array to be added
    
    init() {
        let jsonData = tr_example_json.data(using: .utf8)!
                 let arr: [CodeExample] = try! JSONDecoder().decode([CodeExample].self, from: jsonData)
             for item in arr {
                exampleArray.append(item)
             }
         
    }
    
}
