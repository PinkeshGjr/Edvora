//
//  EdvoraApp.swift
//  Shared
//
//  Created by  on 24/11/21.
//

import SwiftUI

@main
struct EdvoraApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
