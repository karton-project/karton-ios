//
//  CodeBlockExamplesViewController.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 24.10.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit

extension CodeBlockExamplesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath)
        return cell
    }
    
    
}

class CodeBlockExamplesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let url = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
