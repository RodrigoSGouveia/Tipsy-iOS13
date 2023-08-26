//
//  CalculateTipBrain.swift
//  Tipsy
//
//  Created by Rodrigo Gouveia on 24/08/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateTipBrain{
	var tip: Tip?
	
	func getBill() -> Double{
		return tip?.bill ?? Double(0)
	}
	
	func getTip() -> Double{
		return tip?.tipPercent ?? 0.0
	}
	
	func getSplit() -> Int{
		return tip?.split ?? 0
	}
	
	func getTotalValue() -> Double{
		return tip?.value ?? 0.0
	}
	
	func getTipComplete() -> Tip {
		return tip!
	}
	
	mutating func calculateTip(bill: Double, tipPercent: Double, split: Int){
		let finalValue = (bill/Double(split)) * Double(tipPercent)
		tip = Tip(bill: bill, tipPercent: tipPercent, split: split, value: finalValue)
	}
}
