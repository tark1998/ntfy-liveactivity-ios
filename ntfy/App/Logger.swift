//
//  Logger.swift
//  ntfy
//
//  Created by tark1998 on 4/15/25.
//

//
//  Logger.swift
//  LiveActivityPushDemo
//
//  Created by guoxingxu on 2024/10/11.
//

import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!

    static let liveactivity = Logger(subsystem: subsystem, category: "liveactivity")
}
