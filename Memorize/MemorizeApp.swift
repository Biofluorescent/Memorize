//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Tanner Quesenberry on 12/17/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
