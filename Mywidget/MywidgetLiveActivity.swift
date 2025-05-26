//
//  MywidgetLiveActivity.swift
//  Mywidget
//
//  Created by tark1998 on 4/15/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MywidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}
@available(iOS 17.0, *)
struct MywidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
            // Lock screen/banner UI goes here

        ActivityConfiguration(for: MywidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T ")
            } minimal: {
                Text("\(context.state.emoji)")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MywidgetAttributes {
    fileprivate static var preview: MywidgetAttributes {
        MywidgetAttributes(name: "World")
    }
}

extension MywidgetAttributes.ContentState {
    fileprivate static var smiley: LiveActivityAttributes.ContentState {
        LiveActivityAttributes.ContentState(emoji: "😀")
    }
    fileprivate static var starEyes: LiveActivityAttributes.ContentState {
        LiveActivityAttributes.ContentState(emoji: "🤩")
    }
}

@available(iOS 17.0, *)
#Preview("Notification", as: .content, using: MywidgetAttributes.preview) {
   MywidgetLiveActivity()
} contentStates: {
    MywidgetAttributes.ContentState.smiley
    MywidgetAttributes.ContentState.starEyes
}
