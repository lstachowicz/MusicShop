//
//  DataContainer.swift
//  MusicShop
//
//  Created by Stachowicz, Lukasz on 20/05/17.
//  Copyright © 2017 Stachowicz. All rights reserved.
//

class DataContainer {
	var m_data: [String] = ["One", "Two", "Three", "Four", "Five", "Six"]
	
	var m_center_index: Int = 0
	
	func GetDataAt(pos: Int) -> String {
//		let index: Int = pos % m_data.count
		var index: Int = m_data.count + pos;
		if (index < 0) {
			index = m_data.count - index
		}
		
		index = index % m_data.count
		
		return m_data[index]
	}
	
	func GetCeneterData() -> String {
		return m_data[m_center_index]
	}
	
	func GetCeneterIndex() -> Int {
		return m_center_index
	}
	
	func MoveCenterTo(pos: Int) {
		var index: Int = m_data.count + pos;
		if (index < 0) {
			index = m_data.count - index
		}
		
		m_center_index = index % m_data.count;
	}
}
