//
//  FilteringChallenge.swift
//  CoreDataProject
//
//  Created by Fauzan Dwi Prasetyo on 01/07/23.
//

import CoreData
import SwiftUI

struct FilteringChallenge<Entity: NSManagedObject, ContentView: View>: View {
        
    @FetchRequest var fetchRequest: FetchedResults<Entity>
    
    var view: (Entity) -> ContentView
        
    var body: some View {
        List(fetchRequest, id: \.self) { entity in
            self.view(entity)
        }
    }
    
    init(predicate: String, filterKey: String, filterValue: String, @ViewBuilder view: @escaping (Entity) -> ContentView) {
        _fetchRequest = FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        self.view = view
    }
}
