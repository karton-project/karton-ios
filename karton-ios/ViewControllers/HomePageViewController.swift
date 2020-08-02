//
//  HomePageViewController.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 05.07.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit

extension HomePageViewController:
    
UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentsDataSource.contentsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ProblemCell", for: indexPath) as! HomePageCollectionViewCell
        
        let content = contentsDataSource.contentsArray[indexPath.row]
        
        item.problemImageView.image = UIImage(named: String(content.id))
        item.nameUILabel.text = content.name
        item.descriptionUILabel.text = content.detail
        
        item.nameUILabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        item.öğren.tag = indexPath.row
        
        let öğrenLayer = item.öğren.layer
        let deneLayer = item.dene.layer
        
        öğrenLayer.cornerRadius = 15
        deneLayer.cornerRadius = 15
        
        öğrenLayer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        öğrenLayer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        öğrenLayer.shadowOpacity = 1.0
        öğrenLayer.shadowRadius = 0.0
        öğrenLayer.masksToBounds = false
        
        deneLayer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        deneLayer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        deneLayer.shadowOpacity = 1.0
        deneLayer.shadowRadius = 0.0
        deneLayer.masksToBounds = false
        
        
        
        return item
        
    }
    
    
    
}

class HomePageViewController: UIViewController {
    
     let contentsDataSource = ContentsDataSource()

    @IBOutlet weak var problemCollectionView: UICollectionView!
    
    @IBOutlet weak var noteButton: UIButton!
    
    @IBAction func learnAction(_ sender: UIButton) {

        let vc = WebKitViewController(nibName: "WebKitViewController", bundle: nil)
        let indexpath = sender.self.tag
        let content = contentsDataSource.contentsArray[indexpath]
        let link = content.docsLink
        vc.link = link
        navigationController?.pushViewController(vc, animated: true)

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteButton.layer.cornerRadius = noteButton.frame.height * 0.50
        noteButton.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
        title = "Contents"
        
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        
        
    }
    




