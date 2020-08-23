//
//  TextRecognitionViewController.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 14.08.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit
import AVFoundation

class TextRecognitionViewController: UIViewController {
    
    
    @IBOutlet weak var photoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let cameraView = UIImagePickerController()
                    cameraView.delegate = self as?
                        UIImagePickerControllerDelegate &
                        UINavigationControllerDelegate
                    cameraView.sourceType = .camera
                    self.present(cameraView, animated: true, completion: nil)
            photoView = cameraView.view
                }

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
