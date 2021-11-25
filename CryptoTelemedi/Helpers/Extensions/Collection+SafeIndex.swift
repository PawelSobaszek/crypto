//
//  Collection+SafeIndex.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 25/11/2021.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
