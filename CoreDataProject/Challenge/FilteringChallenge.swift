//
//  FilteringChallenge.swift
//  CoreDataProject
//
//  Created by Fauzan Dwi Prasetyo on 01/07/23.
//

import CoreData
import SwiftUI

enum Predicates: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS"
    case endsWith = "ENDSWITH"
    case beginsWithCaseInsensitive = "BEGINSWITH[c]"
    case containsCaseInsensitive = "CONTAINS[c]"
    case endsWithCaseInsensitive = "ENDSWITH[c]"
}

struct FilteringChallenge<Entity: NSManagedObject, ContentView: View>: View {
        
    @FetchRequest var fetchRequest: FetchedResults<Entity>
    
    var view: (Entity) -> ContentView
        
    var body: some View {
        List(fetchRequest, id: \.self) { entity in
            self.view(entity)
        }
    }
    
    init(predicate: Predicates, filterKey: String, filterValue: String, @ViewBuilder view: @escaping (Entity) -> ContentView) {
        _fetchRequest = FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.view = view
    }
}
