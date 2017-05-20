//
//  ScrollGesture.swift
//  MusicShop
//
//  Created by Stachowicz, Lukasz on 20/05/17.
//  Copyright © 2017 Stachowicz. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

enum ScrollDirection: Int {
	case UP = 0
	case DOWN
}

protocol ScrollGestureRecognizerDelegate : NSObjectProtocol {
	func scrollViewDidScroll(scrollGesture: ScrollGestureRecognizer, scrollDirection: ScrollDirection)
}

class ScrollGestureRecognizer : UIGestureRecognizer {
	var m_listener: ScrollGestureRecognizerDelegate? = nil
	var m_last_point: Int = 0
	var m_scroll_minimal_diff = 10
	
	func minimalScrollDiff(scrollMinimalDiff: Int) {
		m_scroll_minimal_diff = scrollMinimalDiff
	}
	
	func registerListener(listener: ScrollGestureRecognizerDelegate) {
		m_listener = listener
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
		super.touchesBegan(touches, withEvent: event)
		
		if (touches.count == 1) {
			state = .Possible
			
			m_last_point = Int((touches.first?.locationInView(self.view))!.y)
		}
		else {
			state = .Failed
		}
	}
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
		super.touchesMoved(touches, withEvent: event)
		
		if (state == .Failed) {
			return
		}
		
		if (touches.count == 1) {
			state = .Began
			
			let currentPoint: Int = Int((touches.first?.locationInView(self.view))!.y)
			let currentMove: Int = m_last_point - currentPoint
			
			if (currentMove > m_scroll_minimal_diff) {
				m_last_point = currentPoint
				m_listener?.scrollViewDidScroll(self, scrollDirection: ScrollDirection.UP)
			}
			else if (currentMove < -m_scroll_minimal_diff) {
				m_last_point = currentPoint
				m_listener?.scrollViewDidScroll(self, scrollDirection: ScrollDirection.DOWN)
			}
		}
		else {
			state = .Failed
		}
	}
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
		super.touchesEnded(touches, withEvent: event)
		
		if (state == .Failed) {
			return
		}
		
		m_last_point = 0
		if (state == .Began) {
			state = .Ended
		} else {
			state = .Failed
		}
	}
}