//
//  ViewController.swift
//  TiroAlBlanco
//
//  Created by Becario on 1/18/20.
//  Copyright © 2020 Fernando. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    var currentValue: Int = 0 //No es necesario de que tipo es la variable cuurentValue = 0
    var targetValue = Int.random(in: 1...100)
    var round = 0
    var score = 0
    
    //Existen varios tippos de comentarios
    //FIXME: - arrglar
    //TODO: - esta en prueba
    //MARK:  - Outlets
    
    //Poner de que tipo es el oulet (button, label, slider, etc...)
    @IBOutlet weak var showAlert: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targerNumberLabel: UILabel!
    @IBOutlet weak var socreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showAlert.tintColor = .black
        targerNumberLabel.text = "\(targetValue)"
        let thumblImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumblImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftRizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftRizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    //MARK: - Methods
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels(){
        targerNumberLabel.text = "\(targetValue)"
        //roundLabel.text = String(round)
        roundLabel.text = "\(round)"
        socreLabel.text = "\(score)"
    }
    
    //MARK: - Actions
    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        
        if difference == 0{
            title = "Sos un crack!"
            points += 100
        }else if difference < 5{
            title = "Casi le atinas"
            if difference == 1{
                points = 50
            }
        }else if difference < 10{
            title = "Puntos por lastima :("
            points += 1
        }else{
            title = "No te acercaste nada... ten una paleta"
        }
        score += points
        
        let message = "Tu puntuacion es: \(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in  self?.startNewRound()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func sliderAction(_ sender: Any) {
        currentValue = lroundf(slider.value)
        //Inter-polacion para agregar variables
        print("El valor del slider es \(currentValue)")
    }
    @IBAction func startNewGameAction(_ sender: Any) {
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
}

