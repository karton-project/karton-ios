//
//  CollectionTableViewCell.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 27.10.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return innerContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.title.text = innerContent[indexPath.row].name
        
        let code = innerContent[indexPath.row].code
        cell.code.text = ""
        for line in code {
            cell.code.text! += line.command
            cell.code.text! += " "
            cell.code.text! += line.input
        }
        
        cell.layer.cornerRadius = bounds.height/40
        cell.title.font = UIFont.boldSystemFont(ofSize: cell.title.font.pointSize)
        
        cell.calistirButton.layer.cornerRadius = bounds.height/40
        cell.kodaEkleButton.layer.cornerRadius = bounds.height/40
        cell.duzenleButton.layer.cornerRadius = bounds.height/40
        cell.silButton.layer.cornerRadius = bounds.height/40
            
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    
}

class CollectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var groupTitle: UILabel!
    let codeExampleDataSource = CodeExamplesDataSource()
    public var innerContent: [Program]! 

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
