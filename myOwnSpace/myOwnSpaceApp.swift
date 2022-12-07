//
//  myOwnSpaceApp.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/07.
//

import SwiftUI

@main
struct myOwnSpaceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
