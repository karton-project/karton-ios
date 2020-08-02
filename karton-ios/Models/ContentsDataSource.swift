//
//  ContentsDataSource.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 05.07.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

class ContentsDataSource {
    var contentsArray: [Content] = [] // turkish contents
    // en version array to be added
    
    init() {
         let jsonData = tr_content_json.data(using: .utf8)!
                  let arr: [Content] = try! JSONDecoder().decode([Content].self, from: jsonData)
              for item in arr {
                  contentsArray.append(item)
              }
    }
    
}

