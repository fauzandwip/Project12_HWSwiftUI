//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Fauzan Dwi Prasetyo on 27/06/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
