//
//  ViewController.swift
//  TiroAlBlanco
//
//  Created by Proteco on 1/18/20.
//  Copyright © 2020 Rodrigo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var showAlert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //showAlert.backgroundColor = .red
        showAlert.tintColor = .blue
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(
            title: "Hola soy una alerta",
            message: "Hola mndo",
            preferredStyle: .alert)
        
        let action  = UIAlertAction(
            title: "YEY",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
    }

    
    
}

