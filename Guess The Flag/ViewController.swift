//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Kevin Stradtman on 3/25/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var flagImageButton: UIButton!
    @IBOutlet var flagImageButton2: UIButton!
    @IBOutlet var flagImageButton3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
       countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        flagImageButton.layer.borderWidth = 1
        flagImageButton2.layer.borderWidth = 1
        flagImageButton3.layer.borderWidth = 1
        
        flagImageButton.layer.borderColor = UIColor.lightGray.cgColor
        flagImageButton2.layer.borderColor = UIColor.lightGray.cgColor
        flagImageButton3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flagImageButton.setImage(UIImage(named: countries[0]), for: .normal)
        flagImageButton2.setImage(UIImage(named: countries[1]), for: .normal)
        flagImageButton3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
}

