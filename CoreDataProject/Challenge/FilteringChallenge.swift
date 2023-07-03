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

struct FilteredListChallenge<Entity: NSManagedObject, ContentView: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<Entity>
    var view: (Entity) -> ContentView
        
    var body: some View {
        List(fetchRequest, id: \.self) { entity in
            self.view(entity)
        }
    }
    
    init(predicate: Predicates, filterKey: String, filterValue: String, sortDescriptors: [SortDescriptor<Entity>], @ViewBuilder view: @escaping (Entity) -> ContentView) {
        _fetchRequest = FetchRequest(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.view = view
    }
}

struct FilteringChallenge: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var singers: FetchedResults<Singer>
    
    @State private var lastNameFilter = "A"
    
    private var sortDescriptor = [SortDescriptor(\Singer.lastName, order: .forward)]
    
    var body: some View {
        VStack {
            FilteredListChallenge(predicate: Predicates.beginsWith, filterKey: "lastName", filterValue: lastNameFilter, sortDescriptors: sortDescriptor) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Example") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}
