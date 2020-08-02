//
//  WebKitViewController.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 2.08.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController, WKUIDelegate {
    
   var link: String?

    @IBOutlet weak var WebView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        WebView = WKWebView(frame: .zero, configuration: webConfiguration)
        WebView.uiDelegate = self
        view = WebView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: link!)
        let myRequest = URLRequest(url: myURL!)
        WebView.load(myRequest)
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
