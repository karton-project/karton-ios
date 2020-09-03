//
//  MainViewController.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 3.09.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBAction func firstButtonAction(_ sender: UIButton) {
        
        firstView.isHidden = false
        secondView.isHidden = true
    }
    
    @IBAction func secondButtonAction(_ sender: UIButton) {
        
        firstView.isHidden = true
        secondView.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.isHidden = false
        secondView.isHidden = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
