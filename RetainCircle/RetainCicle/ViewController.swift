//
//  ViewController.swift
//  RetainCicle
//
//  Created by Samuel Arturo Garrido Sánchez on 01/04/20.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func botoncito(_ sender: Any) {
        
        let secondStoryboard = UIStoryboard(name: "SecondStoryboard",bundle: nil)
        let secondVC = secondStoryboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    deinit {
        print("Ya lo perdí x2")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

