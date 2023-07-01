//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Fauzan Dwi Prasetyo on 30/06/23.
//

import CoreData
import SwiftUI

struct FilteredList<T:NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content ) {
        _fetchRequest = FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
