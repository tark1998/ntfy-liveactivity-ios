//
//  MywidgetBundle.swift
//  Mywidget
//
//  Created by tark1998 on 4/15/25.
//

import WidgetKit
import SwiftUI

@main
struct MywidgetBundle: WidgetBundle {
    var body: some Widget {
        Mywidget()
        MywidgetControl()
        MywidgetLiveActivity()
    }
}
