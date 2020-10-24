//
//  Program.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 25.10.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

struct Program: Decodable {
    
    let name: String
    var code: Array<CodeLine> = Array()
    let bitmap: String
    
}
