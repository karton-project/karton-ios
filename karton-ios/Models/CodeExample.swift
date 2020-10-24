//
//  CodeExample.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 24.10.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

struct CodeExample: Decodable {
    
    let name: String
    var programList: Array<Program> = Array()
    
}
