//
//  Program.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 25.10.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

struct Program: Codable {
    
    let name: String
    let code: [CodeLine]
}
