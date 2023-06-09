//
//  RTSPPlayerSUIApp.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/05.
//

import SwiftUI

@main
struct RTSPPlayerSUIApp: App {
#if os(tvOS) || os(iOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
#endif
    var body: some Scene {
        WindowGroup {
            SettingsView()
        }
    }
}
#if os(tvOS) || os(iOS)
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        application.isIdleTimerDisabled = true
        return true
    }
}
#endif
