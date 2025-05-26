//
//  Send2Server.swift
//  ntfy
//
//  Created by tark1998 on 4/15/25.
//

//
//  Send2Server.swift
//  ntfy
//
//  Created by tark1998 on 4/2/25.
//
import UIKit
import os.log

struct Send2Server {
    static func send(token: String, addr: String) {
        guard let url = URL(string: Config.appBaseUrl+"/api/"+addr) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = ["token": token]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                Logger.liveactivity.info("Error sending token to server: \(error)")
                return
            }
            Logger.liveactivity.info("token successfully sent to server")
        }

        task.resume()
    }
}
