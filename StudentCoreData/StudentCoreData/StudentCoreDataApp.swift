//
//  StudentCoreDataApp.swift
//  StudentCoreData
//
//  Created by Vanieka Sharma on 14/09/2023.
//

import SwiftUI

@main
struct StudentCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager()
            )
        }
    }
}
