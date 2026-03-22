//
//  SettingsVC.swift
//  RTSPPlayer
//
//  Created by bi119aTe5hXk on 2026/03/22.
//

import Foundation

class SettingsVC: ObservableObject {
	var ud = UD()
	init() {
		autoPlayWhenOpen = ud.getPlayWhenOpen()
	}

	@Published var autoPlayWhenOpen: Bool = false {
		didSet {
			ud.setPlayWhenOpen(autoPlayWhenOpen)
		}
	}

}
