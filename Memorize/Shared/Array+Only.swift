//
//  Array+Only.swift
//  Memorize
//
//  Created by Andrew on 2020/8/27.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
