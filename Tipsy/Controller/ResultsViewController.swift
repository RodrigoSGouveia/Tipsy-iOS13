//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rodrigo Gouveia on 23/08/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
	@IBOutlet weak var settingsLabel: UILabel!
	@IBOutlet weak var totalLabel: UILabel!
	var tip: Tip?
	var percent = "0%"

	
	override func viewDidLoad(){
		super.viewDidLoad()
		switch tip?.tipPercent{
		case 0.1:
			percent = "10%"
		default:
			percent = "20%"
			
		}
		totalLabel.text = String(format: "R$%.2f", tip?.value ?? 0 )
		settingsLabel.text = "Split between \(Int(tip?.split ?? 0)) people, with \(percent) tip."
	}
	
	
	@IBAction func onRecalculatePressed(_ sender: UIButton) {
		self.dismiss(animated: true)
	}
}
