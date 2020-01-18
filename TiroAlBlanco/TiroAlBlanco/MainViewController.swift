//
//  ViewController.swift
//  TiroAlBlanco
//
//  Created by Becario on 1/18/20.
//  Copyright © 2020 Fernando. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showAlert.tintColor = .black
    }
    @IBOutlet weak var showAlert: UIButton!
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Hola soy una alerta", message: "Hola so una alerta de ejemplo", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "YEY", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

}

