//
//  ViewController.swift
//  TiroAlBlanco
//
//  Created by Proteco on 25/01/20.
//  Copyright © 2020 Julio. All rights reserved.
//  

import UIKit

class MainViewController: UIViewController {
    //MARK: - Properties
    var currentValue: Int = 0
    var targetValue = 0
    var round = 0
    var score = 0
    
    
    //MARK: - Outlets
    @IBOutlet weak var showAlert: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetnumber: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //showAlert.backgroundColor = .red
        showAlert.tintColor = .blue
        targetValue = Int.random(in: 1...100)
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLefResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLefResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        startNewRoud()
    }
    //MARK: - Methods
    func startNewRoud(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetnumber.text = "\(targetValue)"
        roundLabel.text = String(round)
        scoreLabel.text = String(score)
    }
    
    //MARK: - Actions
    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        var title: String
        
        if difference == 0{
            title = "Sos un crack!"
            points += 100
        } else if difference < 5{
            title = "Casi le atinas -.-"
            if difference == 1{
                points += 50
            }
        } else if difference < 10{
            title = "Puntos por lastima"
            points += 1
        } else {
            title = ":,V"
            
        }
        score += points
        let message = "Tu puntuacion es: \(points)"
        //        let message = "El valor del slider es de: \(currentValue)" + "\nEl valor del objetivo es de: \(targetValue)"
        //
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action  = UIAlertAction(
            title: "OK",
            style: .default,
            handler: {[weak self]_ in self?.startNewRoud()})//comentario
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
    }
    
    
    
    @IBAction func sliderButton(_ sender: Any) {
        currentValue = lroundf(slider.value)
        print("El valor el sileder es\(currentValue)")
    }
    
    @IBAction func startNewGameAccion(_ sender: Any) {
        score = 0
        round = 0
        startNewRoud()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction=CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
}
