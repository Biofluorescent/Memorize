//
//  Array+Only.swift
//  Memorize
//
//  Created by Tanner Quesenberry on 12/22/20.
//

import Foundation

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
