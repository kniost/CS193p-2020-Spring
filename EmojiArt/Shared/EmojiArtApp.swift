//
//  EmojiArtApp.swift
//  Shared
//
//  Created by Andrew on 2020/8/30.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
