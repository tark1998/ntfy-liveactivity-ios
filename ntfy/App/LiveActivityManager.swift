//
//  LiveActivityManager.swift
//  ntfy
//
//  Created by tark1998 on 4/15/25.
//

//
//  LiveActivityManager.swift
//  LiveActivityPushDemo
//
//  Created by guoxingxu on 2024/1/30.
//

import Foundation
import ActivityKit
import os.log
import UIKit


class LiveActivityManager: NSObject, ObservableObject {
    public static let shared: LiveActivityManager = LiveActivityManager()
    
    private var currentActivity: Activity<MywidgetAttributes>? = nil
        
    override init() {
        super.init()
    }
       
    
    func getPushToStartToken() {
        if #available(iOS 17.2, *) {
            Task {
                for await data in Activity<MywidgetAttributes>.pushToStartTokenUpdates {
                    let token = data.map {String(format: "%02x", $0)}.joined()
                        print("Activity PushToStart Token: \(token)")
                        Logger.liveactivity.info("Activity PushToStart Token: \(token, privacy: .public)")
                        //send this token to your notification server
                        Send2Server.send(token: token, addr: "push-to-start-token")
                    }
            }
        
        }
    }
}
