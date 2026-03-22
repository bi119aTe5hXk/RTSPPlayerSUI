//
//  SettingsView.swift
//  RTSPPlayer
//
//  Created by bi119aTe5hXk on 2026/03/22.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var settingsVC: SettingsVC

	var body: some View {
		NavigationStack{
			VStack{
				HStack{
					Text("Settings")
						.font(.largeTitle).bold()
						.padding(10)
					Spacer()
				}

				List{
					Section(header: Text("Main") ) {
						Toggle("Start playback when app open", isOn: $settingsVC.autoPlayWhenOpen)
					}
				}
			}
		}
	}
}
