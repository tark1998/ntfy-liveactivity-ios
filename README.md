# ntfy-liveactivity-ios
This is the iOS app for [ntfy-liveactivity](https://github.com/tark1998/ntfy-liveactivity), fork of the [ntfy-ios](https://github.com/binwiederhier/ntfy-ios).

Also see for basic implementation: https://github.com/xuguoxing/LiveActivityPushDemo

# How to setup

1. Purchase the Apple developer license. You need Apple developer license for building iOS with push notification and live activity function (https://developer.apple.com/support/compare-memberships/)
2. Add `App ID`s or bundle identifiers as following in https://developer.apple.com/account/resources/identifiers/add/bundleId. In my case `[custom id]` is `com.tark1998.trp-activity` 
    - `[custom id]`: capabilities with `App Attest`, `App Groups`, and `Push notification` with `Broadcast Capability`
    - `[custom id].NSE`: capabilities with `App Groups` and `Push notification` with `Broadcast Capability`
    - `[custom id].Mywidget`: capabilities with `App Groups` and `Push notification` with `Broadcast Capability`
3. `PROJECT > ntfy > Build Settings`, change `User-Defined, APP_BASE_URL` `to https://mybaseurl.com:8080`
4. `TARGETS > ntfy, ntfyNSE, MywidgetExtension > Signing & Capabilities`, change to proper `Team` and `Bundle identifier`
5. `TARGETS > ntfy, MywidgetExtension > General`, change `Minimum Depolyments` to iOS 18.0
6. in `Mywidget/MywidgetLiveActivity`, add `ntfy` to `Target Membership` in right side panel
7. Add your `GoogleService-info` under `ntfy/Assets`
8. `ntfy/Persistence/Store`, change `appGroup` to your Apple app group
9. `Product > Scheme > Edit Scheme > Run`, change `Build Configuration` to `Release` for real life usage

# What I have done

See https://apnspush.com/how-to-add-live-activities
1. In Xcode, create a widget extension as `xcode > File > New > Target > Widget extension` and check `include Live Activity`
2. `TARGETS > ntfy > info, add Supports Live Activites: YES` and `Supports Live  Activites Frequent Updates: YES`
3. Make Live activity in `Mywidget/MywidgetLiveActivity.swift`
