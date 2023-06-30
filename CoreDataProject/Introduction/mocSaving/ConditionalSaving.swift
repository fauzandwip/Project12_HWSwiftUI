//
//  ConditionalSaving.swift
//  CoreDataProject
//
//  Created by Fauzan Dwi Prasetyo on 30/06/23.
//

import SwiftUI

struct ConditionalSaving: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("SAVE") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

struct ConditionalSaving_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSaving()
    }
}
