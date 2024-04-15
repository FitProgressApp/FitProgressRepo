//
//  ArrayExtension.swift
//  FitProgress
//
//  Created by Bryan Ceballos on 4/15/24.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
