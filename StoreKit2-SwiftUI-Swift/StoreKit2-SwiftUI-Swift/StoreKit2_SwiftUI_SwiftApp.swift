//
//  StoreKit2_SwiftUI_SwiftApp.swift
//  StoreKit2-SwiftUI-Swift
//
//  Created by Joseph Estanislao Calla Moreyra on 28/11/22.
//

import SwiftUI

@main
struct StoreKit2_SwiftUI_SwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
