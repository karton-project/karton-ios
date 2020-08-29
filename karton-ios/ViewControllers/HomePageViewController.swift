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
        item.dene.tag  = indexPath.row
        
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
        
        item.layer.cornerRadius = 10
        item.layer.borderWidth = 1.0
        item.layer.borderColor = UIColor.clear.cgColor
        item.layer.masksToBounds = true


        
        item.problemImageView.contentMode = UIView.ContentMode.scaleAspectFill
        item.problemImageView.layer.masksToBounds = true
        
        
        
        return item
        
    }

    
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) // Amount of total spacing in a row
               
        if let collection = self.problemCollectionView {
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width / 1.5)
               }
        else {
                return CGSize(width: 0, height: 0)
               }
    }
      
      
      
  }

class HomePageViewController: UIViewController, UIApplicationDelegate {
    
     let contentsDataSource = ContentsDataSource()
     private let spacing: CGFloat = 16.0


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
    
    @IBAction func tryAction(_ sender: UIButton) {
        
        let indexpath = sender.self.tag
        let content = contentsDataSource.contentsArray[indexpath]
        if content.practiceType == "url" {
            let link = content.instruction
            let vc = WebKitViewController(nibName: "WebKitViewController", bundle: nil)
            vc.link = link
            navigationController?.pushViewController(vc, animated: true)
        }
        // else demo camera view
    }
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            // Set up of Coding Screen
            let vc1 = TextRecognitionViewController()
            
            // Set up the second View Controller
            
            // Set up the Tab Bar Controller to have four tabs
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [vc1]
            
            // Make the Tab Bar Controller the root view controller
            window?.rootViewController = tabBarController
            window?.makeKeyAndVisible()
            
            return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteButton.layer.cornerRadius = noteButton.frame.height * 0.50
        noteButton.layer.masksToBounds = true
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.problemCollectionView?.collectionViewLayout = layout
        
        
        // Do any additional setup after loading the view.
        title = "Öğren"
        
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        
        
    }
    




