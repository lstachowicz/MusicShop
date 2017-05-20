//
//  ViewController.swift
//  MusicShop
//
//  Created by Stachowicz, Lukasz on 20/05/17.
//  Copyright © 2017 Stachowicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ScrollGestureRecognizerDelegate {

	var m_data_container = DataContainer()
	
	@IBOutlet var mainView: UIView!
	
	@IBOutlet var First: UILabel!
	@IBOutlet var Second: UILabel!
	@IBOutlet var Center: UILabel!
	@IBOutlet var Fourth: UILabel!
	@IBOutlet var Fivth: UILabel!
	
	@IBOutlet var button: UIButton!
	
	var scrollGesture: ScrollGestureRecognizer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		scrollGesture = ScrollGestureRecognizer()
		scrollGesture.m_listener = self
		mainView.addGestureRecognizer(scrollGesture)
		
		First.text = m_data_container.GetDataAt(m_data_container.GetCeneterIndex() - 2)
		Second.text = m_data_container.GetDataAt(m_data_container.GetCeneterIndex() - 1)
		Center.text = m_data_container.GetCeneterData()
		Fourth.text = m_data_container.GetDataAt(m_data_container.GetCeneterIndex() + 1)
		Fivth.text = m_data_container.GetDataAt(m_data_container.GetCeneterIndex() + 2)
		
		button.enabled = true
		button.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func scrollViewDidScroll(scrollGesture: ScrollGestureRecognizer, scrollDirection: ScrollDirection) {
		switch scrollDirection {
		case ScrollDirection.UP:
			m_data_container.MoveCenterTo(m_data_container.GetCeneterIndex() + 1)
		case ScrollDirection.DOWN:
			m_data_container.MoveCenterTo(m_data_container.GetCeneterIndex() - 1)
		}
		
		First.text = m_data_container.GetDataAt(m_data_container.GetCeneterIndex() - 2)
		Second.text = m_data_container.GetDataAt(m_data_container.GetCeneterIndex() - 1)
		Center.text = m_data_container.GetCeneterData()
		Fourth.text = m_data_container.GetDataAt(m_data_container.GetCeneterIndex() + 1)
		Fivth.text = m_data_container.GetDataAt(m_data_container.GetCeneterIndex() + 2)
	}
	
	func buttonClicked(button:UIButton) {
		print("Button clicked")
	}
}

