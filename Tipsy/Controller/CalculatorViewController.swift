//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
	@IBOutlet weak var splitLabel: UILabel!
	@IBOutlet weak var billLabel: UITextField!
	@IBOutlet weak var stepper: UIStepper!
	@IBOutlet weak var zeroPercent: UIButton!
	@IBOutlet weak var tenPercent: UIButton!
	@IBOutlet weak var twentyPercent: UIButton!
	var tipSelected = 0.1
	var calculateTipBrain = CalculateTipBrain()
	
	@IBAction func onSelectTipPressed(_ sender: UIButton) {
		switch sender.titleLabel?.text{
		case "0%":
			zeroPercent.isSelected = true
			tenPercent.isSelected = false
			twentyPercent.isSelected = false
			tipSelected = 0
		case "10%":
			zeroPercent.isSelected = false
			tenPercent.isSelected = true
			twentyPercent.isSelected = false
			tipSelected = 0.1
		default:
			zeroPercent.isSelected = false
			tenPercent.isSelected = false
			twentyPercent.isSelected = true
			tipSelected = 0.2
		}
	}
	@IBAction func onStepperPressed(_ sender: UIStepper) {
		splitLabel?.text = "\(Int(sender.value))"
	}
	
	@IBAction func onCalculatePressed(_ sender: UIButton) {
		calculateTipBrain.calculateTip(bill: Double(billLabel.text!) ?? 0, tipPercent: tipSelected, split: Int(splitLabel.text!)!)
		print(calculateTipBrain.getTotalValue())
		performSegue(withIdentifier: "goToResults", sender: self)
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "goToResults" {
			let destinationVC = segue.destination as! ResultsViewController
			destinationVC.tip = calculateTipBrain.getTipComplete()
		}
	}
}
