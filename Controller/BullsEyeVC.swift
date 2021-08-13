//
//  ViewController.swift
//  BulsEye
//
//  Created by Ahmed Awaga on 6/8/21.
//

import UIKit

class BullsEyeVC: UIViewController {
    
    //Mark: -Outlet
    @IBOutlet weak var targetlbl: UILabel!
    @IBOutlet weak var scorelbl: UILabel!
    
    @IBOutlet weak var roundlbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    //Mark: -Constants
    
    let midvalue = 50
    var round = 0
    var score = 0
    var target = 0
    var difference = 0
    var currentvalue = 50
    var Status = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        setsliderbardesign()
         open()
    }
    //Mark: -Ibaction
    @IBAction func resetbtnpressed(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func hitmebtnpressed(_ sender: UIButton) {
        newround()
        popalertinfo()
        GenerateRundomNumber()
    }
    
    @IBAction func sliderpressed(_ sender: UISlider) {
        
        currentvalue = (Int(sender.value.rounded()))
    }
    
    //Mark: -Helperfunction
    func setsliderbardesign(){
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider .setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    func GenerateRundomNumber(){
        target = Int.random(in: 2...99)
        targetlbl.text = "\(target)"
    }
    func reset(){
        GenerateRundomNumber()
        round = 1
        score = 0
        difference = 0
        scorelbl.text = "\(score)"
        roundlbl.text = "\(round)"
        slider.value = Float(midvalue)
    }
    func newround(){
        round += 1
        UserDefaults.standard.set(round, forKey: "round")
        UserDefaults.standard.synchronize()
        roundlbl.text = "\(round)"
        slider.value = Float(midvalue)
        
        calcscore()
    }
    func calcscore(){
        
        difference = target > currentvalue ? target - currentvalue : currentvalue - target
        if difference == 0 {
            score += 200
            Status = "Perfect"
            
        } else if difference < 3{
            score += 100
            Status = "Very Good "
            
        }else if difference < 5{
            score += 50
            Status = "Good"
            
        }else if difference < 10{
            score += 20
            Status = "Not Bad"
            
        }else{
            score += 0
            Status = "Good Luck"
        }
        scorelbl.text = "\(score)"
        UserDefaults.standard.set(score, forKey: "score")
        UserDefaults.standard.synchronize()
        
    }
    func popalertinfo(){
        let alert = UIAlertController(title: Status , message: "Your Target = \(target)\n Your Current Value = \(currentvalue)\n  Your Difference = \(difference)\n ", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            self.GenerateRundomNumber()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
            
        }
    func open(){
        score = UserDefaults.standard.integer(forKey: "score")
        scorelbl.text = "\(score)"
        round = UserDefaults.standard.integer(forKey: "round")
        roundlbl.text = "\(round)"
    }
    }
    


