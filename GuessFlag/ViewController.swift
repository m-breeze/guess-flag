//
//  ViewController.swift
//  Project2
//
//  Created by Marina Khort on 28.07.2020.
//  Copyright © 2020 Marina Khort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var button1: UIButton!
	@IBOutlet var button2: UIButton!
	@IBOutlet var button3: UIButton!
	
	
	var countries = [String]()
	var score = 0
	var counter = 0
	var correctAnswer = 0  //track which answer should be the correct one
	
	override func viewDidLoad() {
		super.viewDidLoad()

//		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(scoreTapped))
		button1.layer.borderWidth = 1
		button2.layer.borderWidth = 1
		button3.layer.borderWidth = 1

		button1.layer.borderColor = UIColor.lightGray.cgColor
		button2.layer.borderColor = UIColor.lightGray.cgColor
		button3.layer.borderColor = UIColor.lightGray.cgColor

		countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
		
		askQuestion()
	}

	
	func askQuestion() {
		countries.shuffle()

		button1.setImage(UIImage(named: countries[0]), for: .normal)
		button2.setImage(UIImage(named: countries[1]), for: .normal)
		button3.setImage(UIImage(named: countries[2]), for: .normal)
		
		correctAnswer = Int.random(in: 0...2)
		title = "\(countries[correctAnswer].uppercased()) Score: \(score)/10"
	}

	@IBAction func buttonTapped(_ sender: UIButton) {
		var title: String
		
		if sender.tag == correctAnswer {
			title = "Correct"
			score += 1
		} else {
			title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
			score -= 1
		}
		counter += 1
		askQuestion()
		if counter == 10 {
			let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "END", style: .default))  //askQuestion is closure here
			present(ac,animated: true)
		}
	}
	
//	@objc func scoreTapped() {
//		let scoreStr = "\(score)"
//		let vc = UIActivityViewController(activityItems: [scoreStr], applicationActivities: [])
//		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//		present(vc,animated: true)
//	}
	
	
}

