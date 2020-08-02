//
//  Content.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 05.07.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

struct Content: Decodable {
    
    let detail: String
    let docsLink: String
    let id: Int
    let instruction: String
    let name: String
    let practiceType: String
    
}
