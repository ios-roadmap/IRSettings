// The Swift Programming Language
// https://docs.swift.org/swift-book

import IRCore

@MainActor
public protocol IRSettingsInterface: IRCoordinatorProtocol { }

@MainActor
public protocol IRSettingsFactoryProtocol {
    func create() -> any IRSettingsInterface
}
