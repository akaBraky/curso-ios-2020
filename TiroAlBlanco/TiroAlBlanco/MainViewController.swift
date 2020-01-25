//
//  ViewController.swift
//  TiroAlBlanco
//
//  Created by Proteco on 1/18/20.
//  Copyright © 2020 Rodrigo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Properties
    var currentValue = 0
    var targetValue = Int.random(in: 1...100)
    var round = 0
    var score = 0
    //MARK: - Outlets
    //FIXME: -
    //TODO: -
    @IBOutlet weak var showAlert: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetNumber: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //showAlert.backgroundColor = .red
        showAlert.tintColor = .black
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
            
        
        startNewRound()
    }
    //MARK: - methods
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)/100
        updateLabels()
    }
    
    func updateLabels(){
        targetNumber.text = "\(targetValue)"
        roundLabel.text = "\(round)"
        scoreLabel.text = "\(score)"
    }
    
    //Mark: - actions
    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(targetValue-currentValue)
        var points = 0
        let title : String
        
        if difference == 0 {
            title = "sos un crack!"
            points += 100
        }else if difference < 5 {
            title = "Casi le atinas :("
            if difference == 1 {
                points += 50
            }
        }else if difference < 10 {
            title = "Puntos por lástima :("
            points += 1
        }else {
            title = "No acercaste ni un poquito xd"
        }
        score += points
        let message = "Tu puntuación es \(score)"
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action  = UIAlertAction(
            title: "YEY",
            style: .default,
            handler: { [weak self] _ in self?.startNewRound()
        })
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        currentValue = lroundf(slider.value*100)
        print("El valor del slider es \(currentValue)")
    }
    
    @IBAction func startNewAction(_ sender: Any) {
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut )
        
        view.layer.add(transition, forKey: nil)
    }
    
}

