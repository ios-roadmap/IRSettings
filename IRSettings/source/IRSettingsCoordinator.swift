//
//  IRSettingsCoordinator.swift
//  IRSettings
//
//  Created by Ömer Faruk Öztürk on 6.05.2025.
//

import SwiftUI
import IRCore
import IRSettingsInterface
import IRProfileInterface

// IRSettingsCoordinator.swift
public struct IRSettingsFactory: IRSettingsFactoryProtocol {
    public init() {}
    public func create() -> any IRSettingsInterface { IRSettingsCoordinator() }
}

public final class IRSettingsCoordinator: IRSettingsInterface {

    @IRLazyInjected private var profile: any IRProfileInterface

    // ─────────────────────────────────────────────────────────────
    // MARK: Public entry point
    // ─────────────────────────────────────────────────────────────
    public func start() -> AnyView {
        AnyView(RootView(coordinator: self))
    }

    // ─────────────────────────────────────────────────────────────
    // MARK: Internal routing
    // ─────────────────────────────────────────────────────────────
    enum Route: Hashable { case profile }

    @MainActor
    fileprivate func destination(for route: Route) -> some View {
        switch route {
        case .profile: profile.start()
        }
    }

    fileprivate func goToProfile(on path: inout NavigationPath) {
        path.append(Route.profile)
    }
}

// ──────────────────────────────────────────────────────────────────
// MARK: - RootView (keeps the NavigationPath as @State)
// ──────────────────────────────────────────────────────────────────
private struct RootView: View {

    @ObservedObject var coordinator: IRSettingsCoordinator
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            SettingsView()
                .environmentObject(coordinator)
                .navigationDestination(for: IRSettingsCoordinator.Route.self) {
                    coordinator.destination(for: $0)
                }
        }
        .onReceive(NotificationCenter.default.publisher(for: .init("IRSettings.GoToProfile"))) { _ in
            coordinator.goToProfile(on: &path)
        }
    }
}

// ──────────────────────────────────────────────────────────────────
// MARK: - SettingsView (dumb UI, delegates navigation)
// ──────────────────────────────────────────────────────────────────
private struct SettingsView: View {

    @EnvironmentObject private var coordinator: IRSettingsCoordinator

    var body: some View {
        VStack {
            Text("Settings").font(.title)
            Button("Back to Profile") {
                NotificationCenter.default.post(name: .init("IRSettings.GoToProfile"), object: nil)
            }
        }
        .navigationTitle("Settings")
    }
}
