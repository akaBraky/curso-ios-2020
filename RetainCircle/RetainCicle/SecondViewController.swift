//
//  SecondViewController.swift
//  RetainCicle
//
//  Created by Samuel Arturo Garrido Sánchez on 01/04/20.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var alertAction: UIButton!
    var alert = UIAlertController()
    
    @IBAction func alerta(_ sender: Any) {
        alert = Alertita()
        present(alert,animated: true,completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Algo"), object: nil, queue: .main){ notification in
            self.sayHello()
        }
    }
    
    func sayHello(){
        print("Hola")
    }
    deinit {
        print("Ya lo perdí")
    }
    
    func Alertita() -> UIAlertController{
        let alert = UIAlertController(title: "Hola", message: "Te has contagiado de COVID 19", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "Nel", style: .cancel) { [weak self]_ in
            self?.sayHello()
        }
        alert.addAction(actionAlert)
        return alert
    }

}
