//
//  IRSettingsFactoryProtocol.swift
//  IRSettingsInterface
//
//  Created by Ömer Faruk Öztürk on 06.05.2025.
//

import Foundation

@MainActor
public protocol IRSettingsFactoryProtocol {
    func create() -> any IRSettingsInterface
}
