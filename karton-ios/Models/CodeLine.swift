//
//  CodeLine.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 25.10.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

struct CodeLine: Decodable {
    
    let command: String
    let input: [String]
    let type: Type
    
}

enum Type {
    case X
    case XY
    case XYWH
    case RGB
    case NV
    case N
    case END
    case NONE
}
