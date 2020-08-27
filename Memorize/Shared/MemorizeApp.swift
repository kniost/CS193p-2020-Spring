//
//  MemorizeApp.swift
//  Shared
//
//  Created by Andrew on 2020/8/26.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
