//
//  CollectionViewCell.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 27.10.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var code: UILabel!
    
    @IBOutlet weak var calistirButton: UIButton!
    @IBOutlet weak var duzenleButton: UIButton!
    @IBOutlet weak var kodaEkleButton: UIButton!
    @IBOutlet weak var silButton: UIButton!
}
